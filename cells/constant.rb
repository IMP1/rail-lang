CONSTANT_ESCAPE_CHAR = "\\"

def consume_constant(world, train, stack, end_char)
    constant_chars = []
    train.move(world, true)
    until train.over?(end_char, world)
        unless world.on_map?(*train.position)
            raise EmptySpaceCrash.new
        end
        char = world.cell_at(*train.position).glyph
        constant_chars.push(char)
        if char == CONSTANT_ESCAPE_CHAR
            train.move(world, true)
            escaped_chars = []
            until train.over?(CONSTANT_ESCAPE_CHAR, world)
                unless world.on_map?(*train.position)
                    raise EmptySpaceCrash.new
                end
                escaped_char = world.cell_at(*train.position).glyph
                constant_chars.push(escaped_char)
                train.move(world, true)
            end
            constant_chars.push(CONSTANT_ESCAPE_CHAR)
        end
        train.move(world, true)
    end
    constant = constant_chars.join("")
    # Handle special characters
    constant.gsub!(/\\\[\\/, "[")
    constant.gsub!(/\\\]\\/, "]")
    constant.gsub!(/\\n\\/, "\n")
    constant.gsub!(/\\t\\/, "\t")
    constant.gsub!(/\\\\/, "\\")
    stack.push(constant)
end

Cell.create("Constant", '[') do |cell, world, train, stack, env|
    consume_constant(world, train, stack, ']')
end

Cell.create("Constant", ']') do |cell, world, train, stack, env|
    consume_constant(world, train, stack, '[')
end
