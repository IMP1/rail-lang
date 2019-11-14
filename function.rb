require_relative 'train'

class RailFunction

    attr_reader :name
    attr_reader :world
    attr_reader :train
    attr_reader :running

    def initialize(name, world, stack, all_worlds, parent=nil)
        @name = name
        @world = world
        @all_worlds = all_worlds
        @stack = stack
        @variables = {}
        @running = false
        @train = Train.new(0, 0)
        @child = nil
        @parent = parent
    end

    def dump
        x, y = *@train.position
        $stderr.puts "[#{@name}: #{x}, #{y}] #{@world.cell_at(x, y).glyph}"
    end

    def run
        @running = true
        while @running
            @train.move(@world)
            tick
            if @train.redirected?
                spawn_child(@train.redirection)
            end
            if @train.stopped?
                @running = false
            end
        end
    end

    def current_function
        unless @child.nil?
            return @child
        else
            return self
        end
    end

    def parents
        if @parent.nil?
            return []
        else
            return [*@parent.parents, @parent]
        end
    end

    def spawn_child(function_name)
        @train.redirect(nil)
        @running = false
        world = @all_worlds[function_name]
        if world.nil?
            raise UndefinedFunctionCrash.new(function_name)
        end
        @child = RailFunction.new(function_name, world, @stack, @all_worlds, self)
        @child.run
        @running = true
    end

    def tick
        x, y = *@train.position
        cell = @world.cell_at(x, y)
        cell.activate(@world, @train, @stack, @variables)
    end

end