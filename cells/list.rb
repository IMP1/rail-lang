Cell.create("Nil", 'n') do |cell, world, train, stack, env|
    stack.push([])
end

Cell.create("Cons", ':') do |cell, world, train, stack, env|
    b = stack.pop
    a = stack.pop
    unless Type.list?(a)
        raise TypeMismatchCrash.new(Type::LIST, a)
    end
    c = [b, *a]
    stack.push(c)
end

Cell.create("Breakup", '~') do |cell, world, train, stack, env|
    a = stack.pop
    c, *b = a
    stack.push(b)
    stack.push(c)
end
