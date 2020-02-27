Cell.create("Add", 'a') do |cell, world, train, stack, env|
    b = stack.pop
    a = stack.pop
    unless Type.numeric?(a)
        raise TypeMismatchCrash.new(Type::NUMBER, a)
    end
    unless Type.numeric?(b)
        raise TypeMismatchCrash.new(Type::NUMBER, b)
    end
    c = a.to_i + b.to_i
    stack.push(c.to_s)
end

Cell.create("Divide", 'd') do |cell, world, train, stack, env|
    b = stack.pop
    a = stack.pop
    unless Type.numeric?(a)
        raise TypeMismatchCrash.new(Type::NUMBER, a)
    end
    unless Type.numeric?(b)
        raise TypeMismatchCrash.new(Type::NUMBER, b)
    end
    c = a.to_i / b.to_i
    stack.push(c.to_s)
end

Cell.create("Multiply", 'm') do |cell, world, train, stack, env|
    b = stack.pop
    a = stack.pop
    unless Type.numeric?(a)
        raise TypeMismatchCrash.new(Type::NUMBER, a)
    end
    unless Type.numeric?(b)
        raise TypeMismatchCrash.new(Type::NUMBER, b)
    end
    c = a.to_i * b.to_i
    stack.push(c.to_s)
end

Cell.create("Remainder", 'r') do |cell, world, train, stack, env|
    b = stack.pop
    a = stack.pop
    unless Type.numeric?(a)
        raise TypeMismatchCrash.new(Type::NUMBER, a)
    end
    unless Type.numeric?(b)
        raise TypeMismatchCrash.new(Type::NUMBER, b)
    end
    c = a.to_i % b.to_i
    stack.push(c.to_s)
end

Cell.create("Subtract", 's') do |cell, world, train, stack, env|
    b = stack.pop
    a = stack.pop
    unless Type.numeric?(a)
        raise TypeMismatchCrash.new(Type::NUMBER, a)
    end
    unless Type.numeric?(b)
        raise TypeMismatchCrash.new(Type::NUMBER, b)
    end
    c = a.to_i - b.to_i
    stack.push(c.to_s)
end

(0..9).each do |i|
    Cell.create(i.to_s, i.to_s) do |cell, world, train, stack, env|
        num = i
        stack.push(num.to_s)
    end
end

# This isn't in the Rail Specifications, but there's no way to get a random number otherwise.
Cell.create("Random", 'k') do |cell, world, train, stack, env|
    b = stack.pop
    a = stack.pop
    unless Type.numeric?(a)
        raise TypeMismatchCrash.new(Type::NUMBER, a)
    end
    unless Type.numeric?(b)
        raise TypeMismatchCrash.new(Type::NUMBER, b)
    end
    c = b.to_i + rand(a.to_i - b.to_i)
    stack.push(c.to_s)
end