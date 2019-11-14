require_relative 'train'

class RailFunction

    attr_reader :name
    attr_reader :world
    attr_reader :train
    attr_reader :running

    def initialize(name, world, stack, all_worlds)
        @name = name
        @world = world
        @all_worlds = all_worlds
        @stack = stack
        @variables = {}
        @running = false
        @train = Train.new(0, 0)
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

    def spawn_child(function_name)
        @train.redirect(nil)
        @running = false
        world = @all_worlds[function_name]
        if world.nil?
            raise UndefinedFunctionCrash.new(function_name)
        end
        child = RailFunction.new(function_name, world, @stack, @all_worlds)
        child.run
        @running = true
    end

    def tick
        x, y = *@train.position
        cell = @world.cell_at(x, y)
        cell.activate(@world, @train, @stack)
    end

end