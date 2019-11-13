def junction(cell, world, train, stack, directions)
    unless directions.keys.include?(train.direction)
        raise PerpendicularRailCrash.new(cell)
    end
    x, y = *train.position
    if directions.values.flatten.uniq.any? { |dir| world.cell_to_direction(x, y, dir).empty? }
        raise UnconnectedJunctionCrash.new(cell)
    end
    divert = stack.pop
    outgoing_index = divert ? 1 : 0
    train.turn(directions[train.direction][outgoing_index])
end

Cell.create("Junction", '<') do |cell, world, train, stack|
    directions = {
        # incoming => [left_outgoing, right_outgoing],
        Direction::EAST => [Direction::NORTH_EAST, Direction::SOUTH_EAST],
        Direction::SOUTH_WEST => [Direction::SOUTH_EAST, Direction::WEST],
        Direction::NORTH_WEST => [Direction::WEST, Direction::NORTH_EAST],
    }
    junction(cell, world, train, stack, directions)
end

Cell.create("Junction", '>') do |cell, world, train, stack|
    directions = {
        # incoming => [left_outgoing, right_outgoing],
        Direction::WEST => [Direction::SOUTH_WEST, Direction::NORTH_WEST],
        Direction::SOUTH_EAST => [Direction::EAST, Direction::SOUTH_WEST],
        Direction::NORTH_EAST => [Direction::NORTH_WEST, Direction::EAST],
    }
    junction(cell, world, train, stack, directions)
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
    junction(cell, world, train, stack, directions)
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
    junction(cell, world, train, stack, directions)
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
 

