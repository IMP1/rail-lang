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
    def initialize(glyph)
        super("Unrecognised symbol '#{glyph}'")
    end
end

class StackUnderflowCrash < CrashException
    def initialize
        super("Stack underflow")
    end
end

class TypeMismatchCrash < CrashException
    def initialize(expected, actual)
        super("Type Mismatch: Expected something of type #{expected}, but got '#{typed_value(actual)}'")
    end

    def typed_value(value)
        case value
        when Hash
            return "<lambda>"
        when Array
            return value.inspect
        when String
            return value
        end
    end
end

class UndefinedVariableCrash < CrashException
    def initialize(variable_name)
        super("Undefined variable: #{variable_name}")
    end
end

class UndefinedFunctionCrash < CrashException
    def initialize(function_name)
        super("Undefined function: #{function_name}")
    end
end

class InputUnderflowCrash < CrashException
    def initialize
        super("Input underflow")
    end
end

class BoomCrash < CrashException
    def initialize(value)
        super("Boom! #{value}")
    end
end

class IndexOutOfBoundsCrash < CrashException
    def initialize(obj, index)
        super("Index out of bounds: #{index} in #{obj.inspect}")
    end
end
