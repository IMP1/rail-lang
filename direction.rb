module Direction

    EAST       = 0b0001
    SOUTH      = 0b0010
    WEST       = 0b0100
    NORTH      = 0b1000
    SOUTH_EAST = 0b0011
    SOUTH_WEST = 0b0110
    NORTH_WEST = 0b1100
    NORTH_EAST = 0b1001

    @@compass = [NORTH, NORTH_EAST, EAST, SOUTH_EAST, SOUTH, SOUTH_WEST, WEST, NORTH_WEST]

    def self.turn(direction, amount)
        i = @@compass.index(direction)
        return @@compass[(i + amount) % @@compass.size]
    end

    def self.inverse(direction)
        return Direction.turn(direction, 4)
    end

end