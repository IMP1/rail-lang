class Stack

    def initialize
        @elements = []
    end

    def push(value)
        if $debug
            p @elements
        end
        @elements.push(value)
    end

    def pop
        if $debug
            p @elements
        end
        if @elements.empty?
            raise StackUnderflowCrash.new
        end
        return @elements.pop
    end

    def size
        @elements.size
    end

end