class Train

    attr_reader :position
    attr_reader :direction
    attr_reader :redirection

    def initialize(*position)
        @position = [*position]
        @direction = Direction::SOUTH_EAST
        @stopped = false
        @redirection = nil
    end

    def redirected?
        !@redirection.nil?
    end

    def redirect(new_function)
        @redirection = new_function
    end

    def stopped?
        @stopped
    end

    def stop
        @stopped = true
    end

    def move(world, force=false)
        new_cell = world.cell_to_direction(*@position, @direction)
        x, y = *new_cell.position
        @position = [x, y]
        if new_cell.empty? and not force
            raise EmptySpaceCrash.new
        end
        if new_cell.unrecognised? and not force
            raise UnrecognisedSymbolCrash.new
        end
    end

    def turn(direction)
        @direction = direction
    end

    def over?(glyph, world)
        return world.cell_at(*self.position).glyph == glyph
    end

end