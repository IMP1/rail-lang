require_relative '../test'

Test.require do

    require_relative '../../runner'

end


test_run_1 = Test.run do
    source = '
$ \'main\'
 \
  --[1](!a!)(a)o#
'
    runner = Runner.new(source)
    runner.run
end

test_run_1.ensure do |result|
    assert(result.success)
    assert(result.output.chomp == "1")
end
