Cell.create("Add", 'a') do |cell, world, train, stack, env|
    a = stack.pop
    b = stack.pop
    unless Type.numeric?(a)
        raise TypeMismatchCrash.new(Type::INTEGER, a)
    end
    unless Type.numeric?(b)
        raise TypeMismatchCrash.new(Type::INTEGER, b)
    end
    c = a.to_i + b.to_i
    stack.push(c.to_s)
end

Cell.create("Divide", 'd') do |cell, world, train, stack, env|
    a = stack.pop
    b = stack.pop
    unless Type.numeric?(a)
        raise TypeMismatchCrash.new(Type::INTEGER, a)
    end
    unless Type.numeric?(b)
        raise TypeMismatchCrash.new(Type::INTEGER, b)
    end
    c = a.to_i / b.to_i
    stack.push(c.to_s)
end

Cell.create("Multiply", 'm') do |cell, world, train, stack, env|
    a = stack.pop
    b = stack.pop
    unless Type.numeric?(a)
        raise TypeMismatchCrash.new(Type::INTEGER, a)
    end
    unless Type.numeric?(b)
        raise TypeMismatchCrash.new(Type::INTEGER, b)
    end
    c = a.to_i * b.to_i
    stack.push(c.to_s)
end

Cell.create("Remainder", 'r') do |cell, world, train, stack, env|
    a = stack.pop
    b = stack.pop
    unless Type.numeric?(a)
        raise TypeMismatchCrash.new(Type::INTEGER, a)
    end
    unless Type.numeric?(b)
        raise TypeMismatchCrash.new(Type::INTEGER, b)
    end
    c = a.to_i % b.to_i
    stack.push(c.to_s)
end

Cell.create("Subtract", 's') do |cell, world, train, stack, env|
    a = stack.pop
    b = stack.pop
    unless Type.numeric?(a)
        raise TypeMismatchCrash.new(Type::INTEGER, a)
    end
    unless Type.numeric?(b)
        raise TypeMismatchCrash.new(Type::INTEGER, b)
    end
    c = a.to_i - b.to_i
    stack.push(c.to_s)
end

(0..9).each do |i|
    Cell.create(i.to_s, i.to_s) do |cell, world, train, stack, env|
        num = i.to_s
        stack.push(num)
    end
end