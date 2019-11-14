require_relative 'train'

class RailLambda < RailFunction

    attr_reader :name
    attr_reader :world
    attr_reader :train
    attr_reader :running

    def initialize(name, start, world, stack, variables, all_worlds, parent)
        @name = name
        @world = world
        @stack = stack
        @variables = variables
        @all_worlds = all_worlds
        @running = false
        @train = Train.new(*start[:position])
        @train.turn(start[:direction])
        @child = nil
        @parent = parent
    end

end