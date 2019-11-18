require_relative '../test'

Test.require do

    require_relative '../../runner'

end

test_run_1 = Test.run do
    source = '
$ \'main\'
 \
  --[Printin
'
    runner = Runner.new(source, __FILE__ + "/test_run_1")
    runner.run
end

test_run_1.ensure do |result|
    assert(result.failure)
    assert(result.error.is_a?(EmptySpaceCrash))
end
