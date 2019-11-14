require_relative '../test'

Test.require do

    require_relative '../../runner'

end

test_run_1 = Test.run do
    source = '
$ \'main\'
 \
  \
   --  #
'
    runner = Runner.new(source)
    runner.run
end

test_run_1.ensure do |result|
    assert(result.failure)
    assert(result.error.is_a?(UnconnectedJunctionCrash))
    assert(result.error.location[:cell] == [4, 3])
end


test_run_2 = Test.run do
    source = '
$ \'main\'
 \
  
   ----#
'
    runner = Runner.new(source)
    runner.run
end

test_run_2.ensure do |result|
    assert(result.failure)
    assert(result.error.is_a?(UnconnectedJunctionCrash))
    assert(result.error.location[:cell] == [1, 1])
end



test_run_3 = Test.run do
    source = '
$ \'main\'
 \
  |
'
    runner = Runner.new(source)
    runner.run
end

test_run_3.ensure do |result|
    assert(result.failure)
    assert(result.error.is_a?(UnconnectedJunctionCrash))
    assert(result.error.location[:cell] == [2, 2])
end
