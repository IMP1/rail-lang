Cell.create("Output", 'o') do |cell, world, train, stack|
    puts(stack.pop)
end