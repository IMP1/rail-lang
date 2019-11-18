require_relative '../test'

source = '
$ \'main\'
 \        --[2]-o-#
  \      /
   -----<
         \
          --[3]-o-#
'

runner = nil

Test.require do

    require_relative '../../runner'
    runner = Runner.new(source, __FILE__ + "/test_run_1")

end

test_run = Test.run do
    runner.run
end

test_run.ensure do |result|
    assert(result.failure)
    assert(result.error.is_a?(StackUnderflowCrash))
end
