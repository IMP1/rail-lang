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

    def initialize(source, filename)
        @stack = Stack.new
        @worlds = create_worlds(source, filename)
    end

    def create_worlds(source, filename)
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
            worlds[title] = World.parse(world_source, filename)
        end
        return worlds
    end

    def crash(exception)
        current_function = @function.current_function
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
        $stderr.puts "\tat #{y+1}:#{x+1}"
        function_stack = [*current_function.parents, current_function]
        function_stack.reverse.chunk { |func| func.name }.each do |function_name, recursions|
            $stderr.print "\tin world #{function_name}  (#{recursions.first.world.filename})"
            $stderr.print "  (Recursion depth of #{recursions.size})" if recursions.size > 1
            $stderr.print "\n"
        end
        $stderr.puts
        $stderr.puts world_string
        $stderr.puts
        exception.location = {
            function: func_name,
            cell: [x, y],
        }
        raise exception
    end

    def run(func_name="main")
        if @worlds[func_name].nil?
            crash(UndefinedFunctionCrash.new(func_name))
        end
        @function = RailFunction.new(func_name, @worlds[func_name], @stack, @worlds)
        begin
            @function.run
        rescue CrashException => e
            crash(e)
        rescue StandardError => e
            crash(e)
        end
    end

end
