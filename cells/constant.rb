CONSTANT_ESCAPE_CHAR = "\\"

def consume_constant(world, train, stack, end_char)
    constant_chars = []
    until train.over?(end_char, world)
        train.move(world, true)
        char = world.cell_at(*train.position).glyph
        constant_chars.push(char)
        if char == CONSTANT_ESCAPE_CHAR
            train.move(world, true)
            escaped_chars = []
            until train.over?(CONSTANT_ESCAPE_CHAR, world)
                escaped_char = world.cell_at(*train.position).glyph
                constant_chars.push(escaped_char)
                train.move(world, true)
            end
            constant_chars.push(CONSTANT_ESCAPE_CHAR)
        end
    end
    constant_chars.pop # Remove closing bracket
    constant = constant_chars.join("")
    # Handle special characters
    constant.gsub!(/\\\\/, "\\")
    constant.gsub!(/\\\[\\/, "[")
    constant.gsub!(/\\\]\\/, "]")
    constant.gsub!(/\\n\\/, "\n")
    constant.gsub!(/\\t\\/, "\t")
    stack.push(constant)
end

Cell.create("Constant", '[') do |cell, world, train, stack|
    consume_constant(world, train, stack, ']')
end

Cell.create("Constant", ']') do |cell, world, train, stack|
    consume_constant(world, train, stack, '[')
end
