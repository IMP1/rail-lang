def consume_function(world, train, stack, end_char)
    function_name_chars = []
    train.move(world, true)
    until train.over?(end_char, world)
        char = world.cell_at(*train.position).glyph
        function_name_chars.push(char)
        train.move(world, true)
    end
    train.move(world, true)
    # function_name_chars.pop # Remove closing bracket
    function_name = function_name_chars.join("")
    train.redirect(function_name)
end

Cell.create("Function", '{') do |cell, world, train, stack|
    consume_function(world, train, stack, '}')
end

Cell.create("Function", '}') do |cell, world, train, stack|
    consume_function(world, train, stack, '{')
end

# TODO: Add lambdas here as well