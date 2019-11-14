def straight_rail(cell, world, train, primaries, perpendiculars)
    if perpendiculars.include?(train.direction)
        raise PerpendicularRailCrash.new
    end
    unless primaries.include?(train.direction)
        primaries.each do |dir|
            if train.direction & dir != 0
                train.turn(dir)
            end
        end
    end
    x, y = *train.position
    if world.cell_to_direction(x, y, train.direction).empty?
        secondary_directions = Direction.secondary_directions(train.direction)
        secondary_cells = secondary_directions.map { |dir| world.cell_to_direction(x, y, dir) }
        if secondary_cells.all? { |cell| cell.empty? }
            raise UnconnectedJunctionCrash.new
        end
        if secondary_cells.count { |cell| !cell.empty? } > 1
            raise AmbiguousConnectionCrash.new
        end
        secondary_direction_index = secondary_cells.find_index { |cell| !cell.empty? }
        train.turn(secondary_directions[secondary_direction_index])
    end
end

Cell.create("Rail", '-') do |cell, world, train, stack|
    primaries = [Direction::EAST, Direction::WEST]
    perpendiculars = [Direction::NORTH, Direction::SOUTH]
    straight_rail(cell, world, train, primaries, perpendiculars)
end

Cell.create("Rail", '|') do |cell, world, train, stack|
    primaries = [Direction::NORTH, Direction::SOUTH]
    perpendiculars = [Direction::EAST, Direction::WEST]
    straight_rail(cell, world, train, primaries, perpendiculars)
end

Cell.create("Rail", '\\') do |cell, world, train, stack|
    primaries = [Direction::NORTH_WEST, Direction::SOUTH_EAST]
    perpendiculars = [Direction::NORTH_EAST, Direction::SOUTH_WEST]
    straight_rail(cell, world, train, primaries, perpendiculars)
end

Cell.create("Rail", '/') do |cell, world, train, stack|
    primaries = [Direction::NORTH_EAST, Direction::SOUTH_WEST]
    perpendiculars = [Direction::NORTH_WEST, Direction::SOUTH_EAST]
    straight_rail(cell, world, train, primaries, perpendiculars)
end

Cell.create("Rail", 'x') do |cell, world, train, stack|
    raise PerpendicularRailCrash.new if train.direction == Direction::NORTH
    raise PerpendicularRailCrash.new if train.direction == Direction::EAST
    raise PerpendicularRailCrash.new if train.direction == Direction::SOUTH
    raise PerpendicularRailCrash.new if train.direction == Direction::WEST
end

Cell.create("Rail", '+') do |cell, world, train, stack|
    raise PerpendicularRailCrash.new if train.direction == Direction::NORTH_EAST
    raise PerpendicularRailCrash.new if train.direction == Direction::NORTH_WEST
    raise PerpendicularRailCrash.new if train.direction == Direction::SOUTH_EAST
    raise PerpendicularRailCrash.new if train.direction == Direction::SOUTH_WEST
end

Cell.create("Rail", '*') do |cell, world, train, stack|
    
end

Cell.create("Rail", '@') do |cell, world, train, stack|
    train.turn(Direction.inverse(train.direction))
end
