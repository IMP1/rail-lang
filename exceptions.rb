class CrashException < StandardError

    attr_reader :message

    def initialize(message="")
        @message = message
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