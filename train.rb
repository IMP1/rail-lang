class Train

    attr_reader :position
    attr_reader :direction

    def initialize(*position)
        @position = [*position]
        @direction = Direction::SOUTH_EAST
    end

    def move(world, allow_empty=false)
        # new_cell, x, y, dir = world.next_cell(*@position, @direction, allow_empty)
        # unless dir.nil?
        #     turn(dir)
        # end
        # @position = [x, y]
    end

    def turn(direction)
        @direction = direction
    end

    def at?(cell, world)
        return world.cell_at(*self.position).glyph == cell
    end

end