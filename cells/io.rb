Cell.create("Output", 'o') do |cell, world, train, stack|
    print(stack.pop)
end

Cell.create("EOF", 'e') do |cell, world, train, stack|
    value = ARGV.empty? ? "1" : "0"
    stack.push(value)
end

Cell.create("Output", 'i') do |cell, world, train, stack|
    input = ARGV.shift
    if input.nil?
        raise InputUnderflowCrash.new
    end
    stack.push(input.to_s)
end

Cell.create("Underflow", 'u') do |cell, world, train, stack|
    n = stack.size
    stack.push(n.to_s)
end