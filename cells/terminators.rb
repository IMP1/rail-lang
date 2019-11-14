Cell.create("Start", '$') do |cell, world, train, stack, env|
    train.direction = Direction::SOUTH_EAST
end

Cell.create("End", '#') do |cell, world, train, stack, env|
    train.stop
end

Cell.create("Boom", 'b') do |cell, world, train, stack, env|
    raise BoomCrash.new(stack.pop)
end