module Type

    BOOLEAN = "boolean"
    NUMBER  = "number"
    STRING  = "string"
    LAMBDA  = "lambda"
    LIST    = "list"
    NIL     = "nil"

    def self.boolean?(value)
        return false if value.is_a?(Array)
        return /[10]/ =~ value
    end

    def self.numeric?(value)
        return false if value.is_a?(Array)
        return /\d+/ =~ value
    end

    def self.lambda?(value)
        return false if value.is_a?(Array)
        return value.is_a?(Hash)
    end

    def self.list?(value)
        return false unless value.is_a?(Array)
        return true
    end

    def self.nil?(value)
        return false unless value.is_a?(Array)
        return value.empty?
    end

    def self.to_boolean(value)
        unless Type.boolean?(value)
            raise TypeMismatchCrash.new(BOOLEAN, value)
        end
        return (value.to_i == "1") ? "1" : "0"
    end

    def self.to_lambda(value)
        unless Type.lambda?(value)
            raise TypeMismatchCrash.new(LAMBDA, value)
        end
        return nil # TODO: How should this be represented?
    end

    def self.get_type(value)
        case value
        when Hash
            return LAMBDA
        when Array
            return value.empty? ? NIL : LIST
        else
            return STRING
        end
    end

end