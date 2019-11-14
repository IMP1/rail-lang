Cell.create("Cut", 'c') do |cell, world, train, stack, env|
    a = stack.pop
    b = stack.pop
    unless Type.numeric?(b)
        raise TypeMismatchCrash.new(Type::INTEGER, b)
    end
    unless b >= 0 and b <= a.length
        raise IndexOutOfBoundsCrash.new(a, b)
    end
    c = a[0...b]
    d = a[b..-1]
    stack.push(c)
    stack.push(d)
end

Cell.create("Append", 'p') do |cell, world, train, stack, env|
    a = stack.pop
    b = stack.pop
    c = a + b
    stack.push(c)
end

Cell.create("Size", 'z') do |cell, world, train, stack, env|
    a = stack.pop
    c = a.size
    stack.push(c.to_s)
end