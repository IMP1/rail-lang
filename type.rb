module Type

    BOOLEAN = "boolean"
    NUMBER  = "number"
    STRING  = "string"
    LAMBDA  = "lambda"

    def self.boolean?(value)
        return false unless /\d+/ =~ value
        return value == "1"
    end

    def self.numeric?(value)
        return /\d+/ =~ value
    end

    def self.lambda?(value)
        return nil # TODO: How should this be implemented?
    end

    def self.to_boolean(value)
        unless Type.boolean?(value)
            raise TypeMismatchCrash.new(BOOLEAN, value)
        end
        return value.to_i == 1
    end

    def self.to_lambda(value)
        unless Type.lambda?(value)
            raise TypeMismatchCrash.new(LAMBDA, value)
        end
        return nil # TODO: How should this be represented?
    end

end