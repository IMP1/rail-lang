Cell.create("False", 'f') do |cell, world, train, stack, env|
    n = 0
    stack.push(n.to_s)
end

Cell.create("True", 't') do |cell, world, train, stack, env|
    n = 1
    stack.push(n.to_s)
end

Cell.create("Greater", 'g') do |cell, world, train, stack, env|
    a = stack.pop
    b = stack.pop
    c = (a > b) ? 1 : 0
    stack.push(c.to_s)
end

Cell.create("Equal", 'q') do |cell, world, train, stack, env|
    a = stack.pop
    b = stack.pop
    c = (a == b) ? 1 : 0
    stack.push(c.to_s)
end

Cell.create("Type", '?') do |cell, world, train, stack, env|
    a = stack.pop
    c = Type.get_type(a)
    stack.push(c.to_s)
end