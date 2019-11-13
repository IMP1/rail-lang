require_relative 'train'

class RailFunction

    attr_reader :name
    attr_reader :world
    attr_reader :running

    def initialize(name, world, stack)
        @name = name
        @world = world
        @variables = {}
        @stack = stack
        @running = false
        @train = Train.new(0, 0)
    end

    def run
        @running = true
        while @running
            @train.move(@world)
            begin
                tick
            rescue InvalidRouteException => e
                crash(e)
            end
        end
        @running = false
    end

    def tick
        x, y = *@train.position
        cell = @world.cell_at(x, y)
        begin
            cell.activate(@world, @train, @stack)
        rescue CrashException => e
            crash(e.to_s)
        end
    end

end