VARIABLE_DECLARATION_CHAR = "!"

def consume_variable(world, train, stack, env, end_char)
    variable_chars = []
    assignment = false
    train.move(world, true)
    if world.cell_at(*train.position).glyph == VARIABLE_DECLARATION_CHAR
        assignment = true
        train.move(world, true)
    end
    if assignment
        until train.over?(VARIABLE_DECLARATION_CHAR, world)
            unless world.on_map?(*train.position)
                raise EmptySpaceCrash.new
            end
            char = world.cell_at(*train.position).glyph
            variable_chars.push(char)
            train.move(world, true)
        end
        train.move(world, true) # Skip over VARIABLE_DECLARATION_CHAR
    else
        until train.over?(end_char, world)
            unless world.on_map?(*train.position)
                raise EmptySpaceCrash.new
            end
            char = world.cell_at(*train.position).glyph
            variable_chars.push(char)
            train.move(world, true)
        end
    end
    variable = variable_chars.join("")
    if assignment
        value = stack.pop
        env[variable] = value
    else
        unless env.key?(variable)
            raise UndefinedVariableCrash.new(variable)
        end
        stack.push(env[variable])
    end
end

Cell.create("Constant", '(') do |cell, world, train, stack, env|
    consume_variable(world, train, stack, env, ')')
end

Cell.create("Constant", ')') do |cell, world, train, stack, env|
    consume_variable(world, train, stack, env, '(')
end
