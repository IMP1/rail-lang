require_relative 'exceptions'
require_relative 'stack'
require_relative 'world'
require_relative 'function'
require_relative 'lambda'
require_relative 'type'

Dir["cells/**/*.rb"].each do |cell_file|
    load(cell_file)
end

class Runner

    def initialize(source, filename="")
        @stack = Stack.new
        @worlds = create_worlds(source)
        @main_function = RailFunction.new('main', @worlds['main'], @stack, @worlds)
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
        current_function = @main_function.current_function
        world = current_function.world
        train = current_function.train
        func_name = current_function.name
        cell = world.cell_at(*train.position)
        cells = world.to_a.map { |line| line.map { |cell| cell.glyph } }
        x, y = *train.position
        cells[y] ||= []
        cells[y][x] ||= " "
        cells[y][x] = "\e[31m\e[7m" + cells[y][x] + "\e[0m"
        world_string = cells.map { |line| "\t" + line.join("") }.join("\n")
        $stderr.puts "Crash! #{exception.message}"
        $stderr.puts "\tin world #{func_name}"
        current_function.parents.reverse.each do |parent|
            $stderr.puts "\tin world #{parent.name}"
        end
        $stderr.puts "\tat #{y+1}:#{x+1}"
        $stderr.puts
        $stderr.puts world_string
        $stderr.puts
        exception.location = {
            function: func_name,
            cell: [x, y],
        }
        raise exception
    end

    def run
        begin
            @main_function.run
        rescue CrashException => e
            crash(e)
        end
    end

end
