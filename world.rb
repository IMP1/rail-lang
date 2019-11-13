require_relative 'cell'
require_relative 'direction'

class World
    include Direction

    def initialize(glyph_map)
        @cells = glyph_map.map.with_index do |line, j| 
            line.map.with_index do |glyph, i| 
                Cell.from_glyph(glyph, i, j)
            end
        end
    end

    def self.parse(map_string)
        glyphs = map_string.lines.map { |line| line.chomp.split("") }
        return World.new(glyphs)
    end

    def to_s
        return @cells.map { |line| line.map { |cell| cell.glyph }.join("") }.join("\n")
    end

    def to_a
        return @cells
    end

    def cell_at(x, y)
        return Cell.empty if @cells[y].nil?
        return Cell.empty if @cells[y][x].nil?
        return @cells[y][x]
    end

    def cell_to_direction(x, y, direction)
        if [EAST, SOUTH_EAST, NORTH_EAST].include?(direction)
            x += 1
        end
        if [SOUTH, SOUTH_EAST, SOUTH_WEST].include?(direction)
            y += 1
        end
        if [WEST, SOUTH_WEST, NORTH_WEST].include?(direction)
            x -= 1
        end
        if [NORTH, NORTH_EAST, NORTH_WEST].include?(direction)
            y -= 1
        end
        return cell_at(x, y)
    end

end