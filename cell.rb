class Cell

    EMPTY_GLYPH = " "

    attr_reader :name
    attr_reader :glyph

    def initialize(name, glyph, action)
        @name = name
        @glyph = glyph
        @action = action
    end

    def activate(world, train, stack)
        return if @action.nil?
        @action.call(self, world, train, stack)
    end

    def empty?
        return glyph == EMPTY_GLYPH
    end

    def self.unrecognised(glyph)
        return Cell.new("Unrecognised", glyph, nil)
    end

    def self.empty
        return Cell.new("Empty", EMPTY_GLYPH, nil)
    end

    @@cells_by_glyph = {}

    def self.create(name, glyph, &action)
        if @@cells_by_glyph.key?(glyph)
            raise "Already a cell with #{glyph} glyph."
        end
        cell = Cell.new(name, glyph, action)
        @@cells_by_glyph[glyph] = cell
    end

    def self.from_glyph(glyph)
        return Cell.empty if glyph == EMPTY_GLYPH
        return Cell.unrecognised(glyph) unless @@cells_by_glyph.key?(glyph)
        return @@cells_by_glyph[glyph]
    end

    def self.all_cells
        return @@cells_by_glyph.values.uniq
    end

end