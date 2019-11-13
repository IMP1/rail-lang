require_relative 'exceptions'
require_relative 'stack'
require_relative 'world'
require_relative 'function'

Dir["cells/**/*.rb"].each do |cell_file|
    load(cell_file)
end

class Runner

    def initialize(source)
        @stack = Stack.new
        @worlds = create_worlds(source)
        @current_function = RailFunction.new('main', @worlds['main'], @stack)
    end

    def create_worlds(source)
        worlds = {}
        headers = source.lines
                        .select { |line| /\$\s*'.+?'/ === line }
                        .map { |line| 
                            [line.scan(/\$\s*'(.+?)'/).flatten.first, source.lines.index(line)] 
                        }
        headers.each_with_index do |header, i|
            title, line_start = *header
            line_end = headers[i+1].nil? ? source.lines.size : headers[i+1][1]
            world_source = source.lines[line_start...line_end].join("")
            worlds[title] = World.parse(world_source)
        end
        return worlds
    end

    def crash(exception)
        world = @current_function.world
        train = @current_function.train
        cell = world.cell_at(*train.position)
        cells = world.to_a.map { |line| line.map { |cell| cell.glyph } }
        x, y = *train.position
        cells[y][x] = "\e[31m\e[7m" + cells[y][x] + "\e[0m"
        world_string = cells.map { |line| "\t" + line.join("") }.join("\n")
        puts "Crash! #{exception.message}"
        puts "\tin world #{@current_function.name}"
        puts "\tat #{cell}"
        puts
        puts world_string
        puts
    end

    def run
        begin
            @current_function.run
        rescue CrashException => e
            crash(e)
        end
    end

end
