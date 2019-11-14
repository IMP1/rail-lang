def junction(cell, world, train, stack, directions, branches)
    unless directions.keys.include?(train.direction)
        raise PerpendicularRailCrash.new
    end
    # TODO: make sure all branches are correct as well.
    #       a junction not only must have all outgoing branches,
    #       but all incoming branches as well.
    x, y = *train.position
    if directions.values.flatten.uniq.any? { |dir| world.cell_to_direction(x, y, dir).empty? }
        raise UnconnectedJunctionCrash.new
    end
    if directions.values.flatten.uniq.any? { |dir| world.cell_to_direction(x, y, dir).empty? }
        raise UnconnectedJunctionCrash.new
    end
    begin
        start_dir = Direction.inverse(branches[0])
        expected_glyphs = branches[2..-1]
        if world.cell_to_direction(x, y, start_dir).glyph != branches[1]
            raise UnconnectedJunctionCrash.new
        end
        missing_branches = directions[branches.first].each_with_index.select do |dir, i| 
            world.cell_to_direction(x, y, dir).glyph != expected_glyphs[i] 
        end
        if missing_branches.any?
            raise UnconnectedJunctionCrash.new
        end
    end
    divert_value = stack.pop
    outgoing_index = Type.to_boolean(divert_value) ? 1 : 0
    train.turn(directions[train.direction][outgoing_index])
end

Cell.create("Junction", '<') do |cell, world, train, stack|
    directions = {
        # incoming => [left_outgoing, right_outgoing],
        Direction::EAST => [Direction::NORTH_EAST, Direction::SOUTH_EAST],
        Direction::SOUTH_WEST => [Direction::SOUTH_EAST, Direction::WEST],
        Direction::NORTH_WEST => [Direction::WEST, Direction::NORTH_EAST],
    }
    # incoming => [left_branch_glyph, right_branch_glyph]
    branches = [Direction::EAST, "-", "/", "\\"]
    junction(cell, world, train, stack, directions, branches)
end

Cell.create("Junction", '>') do |cell, world, train, stack|
    directions = {
        # incoming => [left_outgoing, right_outgoing],
        Direction::WEST => [Direction::SOUTH_WEST, Direction::NORTH_WEST],
        Direction::SOUTH_EAST => [Direction::EAST, Direction::SOUTH_WEST],
        Direction::NORTH_EAST => [Direction::NORTH_WEST, Direction::EAST],
    }
    # [incoming, left_branch_glyph, right_branch_glyph]
    branches = [Direction::WEST, "-", "/", "\\"]
    junction(cell, world, train, stack, directions, branches)
end

#  |
#  ^
# / \
Cell.create("Junction", '^') do |cell, world, train, stack|
    directions = {
        # incoming => [left_outgoing, right_outgoing],
        Direction::SOUTH => [Direction::SOUTH_EAST, Direction::SOUTH_WEST],
        Direction::NORTH_EAST => [Direction::NORTH, Direction::SOUTH_EAST],
        Direction::NORTH_WEST => [Direction::SOUTH_WEST, Direction::NORTH],
    }
    # incoming => [left_branch_glyph, right_branch_glyph]
    branches = [Direction::SOUTH, "|", "\\", "/"]
    junction(cell, world, train, stack, directions, branches)
end

# \ /
#  v
#  |
Cell.create("Junction", 'v') do |cell, world, train, stack|
    directions = {
        # incoming => [left_outgoing, right_outgoing],
        Direction::NORTH => [Direction::NORTH_WEST, Direction::NORTH_EAST],
        Direction::SOUTH_EAST => [Direction::NORTH_EAST, Direction::SOUTH],
        Direction::SOUTH_WEST => [Direction::SOUTH, Direction::NORTH_WEST],
    }
    # incoming => [left_branch_glyph, right_branch_glyph]
    branches = [Direction::NORTH, "|", "\\", "/"]
    junction(cell, world, train, stack, directions, branches)
end

# Cell.create("Switch", '=') do |world, train, stack|
#     raise CrashException.new("Perpendicular rail") if train.direction == Direction::NORTH
#     raise CrashException.new("Perpendicular rail") if train.direction == Direction::SOUTH
#     divert = stack.pop
#     if train.direction & Direction::EAST != 0
#         if divert
#             # TODO: find track
#         else
#             train.turn(Direction::EAST)
#         end
#     end
#     if train.direction & Direction::WEST != 0
#         if divert
#             # TODO: find track
#         else
#             train.turn(Direction::WEST)
#         end 
#     end
# end
 

