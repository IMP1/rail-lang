require_relative '../test'

Test.require do

    require_relative '../../runner'
    

end

test_run = Test.run do
    source = File.read("../../../examples/string-lib.rl")
    runner = Runner.new(source, "string-lib.rl")
    runner.run
end

test_run.ensure do |result|
    assert(result.success)
    assert(result.output.chomp == "1")
end
