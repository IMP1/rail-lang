def consume_constant(world, train, stack, end_char)
    constant_chars = []
    until train.over?(end_char, world)
        train.move(world, true)
        constant_chars.push(world.cell_at(*train.position).glyph)
    end
    constant = constant_chars.join("")
    case constant
    when /\d+/
        constant = constant.to_i
    else
        constant = constant.to_s
    end
    stack.push(constant)
end

Cell.create("Constant", '[') do |cell, world, train, stack|
    consume_constant(world, train, stack, ']')
end

Cell.create("Constant", ']') do |cell, world, train, stack|
    consume_constant(world, train, stack, '[')
end
