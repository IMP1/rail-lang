class Cell

    EMPTY_GLYPH = " "
    EMPTY_NAME = "Empty"
    UNRECOGNISED_NAME = "Unrecognised"

    attr_reader :name
    attr_reader :glyph
    attr_reader :position

    def initialize(name, x, y, glyph, action)
        @name = name
        @glyph = glyph
        @position = [x, y]
        @action = action
    end

    def activate(world, train, stack, env)
        return if @action.nil?
        @action.call(self, world, train, stack, env)
    end

    def empty?
        return name == EMPTY_NAME
    end

    def unrecognised?
        return name == UNRECOGNISED_NAME
    end

    def self.unrecognised(glyph, x, y)
        return Cell.new(UNRECOGNISED_NAME, x, y, glyph, nil)
    end

    def self.empty(x, y)
        return Cell.new(EMPTY_NAME, x, y, EMPTY_GLYPH, nil)
    end

    @@cells_by_glyph = {}

    def self.create(name, glyph, &action)
        if @@cells_by_glyph.key?(glyph)
            raise "Already a cell with #{glyph} glyph."
        end
        cell = -> (x, y) { Cell.new(name, x, y, glyph, action) }
        @@cells_by_glyph[glyph] = cell
    end

    def self.from_glyph(glyph, x, y)
        return Cell.empty(x, y) if glyph == EMPTY_GLYPH
        return Cell.unrecognised(glyph, x, y) unless @@cells_by_glyph.key?(glyph)
        return @@cells_by_glyph[glyph].call(x, y)
    end

end