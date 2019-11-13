class CrashException < StandardError

    attr_reader :message
    attr_accessor :location

    def initialize(message="")
        @message = message
        @location = nil
    end

end

class PerpendicularRailCrash < CrashException
    def initialize
        super("Perpendicular rail")
    end
end

class UnconnectedJunctionCrash < CrashException
    def initialize
        super("Unconnected junction")
    end
end

class AmbiguousConnectionCrash < CrashException
    def initialize
        super("Ambiguous connetion")
    end
end

class EmptySpaceCrash < CrashException
    def initialize
        super("Empty space")
    end
end

class UnrecognisedSymbolCrash < CrashException
    def initialize
        super("Unrecognised symbol")
    end
end

class StackUnderflowCrash < CrashException
    def initialize
        super("Stack underflow")
    end
end