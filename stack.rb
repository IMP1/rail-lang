class Stack

    def initialize
        @elements = []
    end

    def push(value)
        @elements.push(value)
    end

    def pop
        if @elements.empty?
            raise StackUnderflowCrash.new
        end
        return @elements.pop
    end

end