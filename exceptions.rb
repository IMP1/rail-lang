class CrashException < Exception

    attr_reader :cell
    attr_reader :train
    attr_reader :world

    def initialize(cell=nil, train=nil, world=nil)
        @cell = cell
        @train = train
        @world = world
    end

end

class PerpendicularRailCrash < CrashException
end

class UnconnectedJunctionCrash < CrashException
end

class AmbiguousConnectionCrash < CrashException
end