require_relative '../test'

Test.require do

    require_relative '../../runner'

end

test_run_1 = Test.run do
    source = '
$ \'main\'
 #
'
    runner = Runner.new(source)
    runner.run
end

test_run_1.ensure do |result|
    assert(result.success)
end
