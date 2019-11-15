module RubyArgParse

    VALUE      = [:keyreq, :key]
    POSITIONAL = [:req]
    FLAG       = [:opt]

    def self.call(func)
        args, kwargs = parse(func)
        puts "Arguments:"
        p ARGV
        p args
        p kwargs
        func.call(*args, **kwargs)
    end

    def self.parse(func)
        cli_args = [*ARGV]
        args = []
        flags = []
        kwargs = {}
        puts "Parameters:"
        p func.parameters
        func.parameters.select { |param| FLAG.include?(param[0]) }.each do |param|
            i = cli_args.index { |a| a == "--#{param[1].to_s}" }
            if i.nil?
                flags.push(false)
            else
                cli_args.delete_at(i)
                flags.push(true)
            end
        end
        func.parameters.select { |param| VALUE.include?(param[0]) }.each do |param|
            key = param[1]
            prompt = key.to_s.tr("_", "-")
            i = cli_args.index { |a| a == "--#{prompt}" }
            next if i.nil?
            cli_args.delete_at(i)
            value = cli_args.delete_at(i)
            raise "No value supplied for #{prompt}" if value.nil?
            kwargs[key] = value
        end
        func.parameters.select { |param| POSITIONAL.include?(param[0]) }.each do |param|
            args.push(cli_args.shift)
        end
        return args + flags, kwargs
    end

end