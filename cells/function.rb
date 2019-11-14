def run_lambda(world, train, stack)
    l = stack.pop
    train.redirect(l)
end

def consume_function(world, train, stack, end_char)
    function_name_chars = []
    train.move(world, true)
    until train.over?(end_char, world)
        unless world.on_map?(*train.position)
            raise EmptySpaceCrash.new
        end
        char = world.cell_at(*train.position).glyph
        function_name_chars.push(char)
        train.move(world, true)
    end
    function_name = function_name_chars.join("")
    if function_name.empty?
        run_lambda(world, train, stack)
    else
        train.redirect(function_name)
    end
end

Cell.create("Function", '{') do |cell, world, train, stack, env|
    consume_function(world, train, stack, '}')
end

Cell.create("Function", '}') do |cell, world, train, stack, env|
    consume_function(world, train, stack, '{')
end

Cell.create("Lambda", '&') do |cell, world, train, stack, env|
    l = { 
        position: [*train.position], 
        direction: train.direction 
    }
    stack.push(l)
    train.turn(Direction.inverse(train.direction))
end
