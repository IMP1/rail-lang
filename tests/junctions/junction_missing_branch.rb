require_relative '../test'

Test.require do

    require_relative '../../runner'

end

test_run_1 = Test.run do
    source = '
$ \'main\'
 \
  \
   -----<
         \
          --[3]-o-#
'
    runner = Runner.new(source, __FILE__ + "/test_run_1")
    runner.run
end

test_run_1.ensure do |result|
    assert(result.failure)
    assert(result.error.is_a?(UnconnectedJunctionCrash))
end


test_run_2 = Test.run do
    source = '
$ \'main\'
 \
  \
   -[1]-<

'
    runner = Runner.new(source, __FILE__ + "/test_run_2")
    runner.run
end

test_run_2.ensure do |result|
    assert(result.failure)
    assert(result.error.is_a?(UnconnectedJunctionCrash))
end


test_run_3 = Test.run do
    source = '
$ \'main\'
 \
  \      -
   -[1]-<
         -
   
'
    runner = Runner.new(source, __FILE__ + "/test_run_3")
    runner.run
end

test_run_3.ensure do |result|
    assert(result.failure)
    assert(result.error.is_a?(UnconnectedJunctionCrash))
end



test_run_4 = Test.run do
    source = '
$ \'main\'
 \
  \      -
   -[1]-<
         \
   
'
    runner = Runner.new(source, __FILE__ + "/test_run_4")
    runner.run
end

test_run_4.ensure do |result|
    assert(result.failure)
    assert(result.error.is_a?(UnconnectedJunctionCrash))
end
