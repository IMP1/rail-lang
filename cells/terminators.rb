Cell.create("Start", '$') do |cell, world, train, stack|
    train.direction = Direction::SOUTH_EAST
end

Cell.create("End", '#') do |cell, world, train, stack|
    train.stop
end