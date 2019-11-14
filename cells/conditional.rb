Cell.create("False", 'f') do |cell, world, train, stack|
    n = 0
    stack.push(n.to_s)
end

Cell.create("True", 't') do |cell, world, train, stack|
    n = 1
    stack.push(n.to_s)
end

Cell.create("Greater", 'g') do |cell, world, train, stack|
    a = stack.pop
    b = stack.pop
    c = (a > b) ? 1 : 0
    stack.push(c.to_s)
end

Cell.create("Equal", 'q') do |cell, world, train, stack|
    a = stack.pop
    b = stack.pop
    c = (a == b) ? 1 : 0
    stack.push(c.to_s)
end