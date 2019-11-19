Cell.create("Cut", 'c') do |cell, world, train, stack, env|
    idx = stack.pop
    str = stack.pop
    unless Type.numeric?(idx)
        raise TypeMismatchCrash.new(Type::NUMBER, idx)
    end
    idx = idx.to_i
    unless idx >= 0 and idx <= str.length
        raise IndexOutOfBoundsCrash.new(str, idx)
    end
    c = str[0...idx]
    d = str[idx..-1]
    stack.push(c)
    stack.push(d)
end

Cell.create("Append", 'p') do |cell, world, train, stack, env|
    b = stack.pop
    a = stack.pop
    c = a + b
    stack.push(c)
end

Cell.create("Size", 'z') do |cell, world, train, stack, env|
    a = stack.pop
    c = a.size
    stack.push(c.to_s)
end