require_relative '../test'

Test.require do

    require_relative '../../runner'

end

test_run_1 = Test.run do
    source = '
$ \'main\'
 \
  /
'
    runner = Runner.new(source)
    runner.run
end

test_run_1.ensure do |result|
    assert(result.failure)
    assert(result.error.is_a?(PerpendicularRailCrash))
    assert(result.error.location[:cell] == [2, 2])
end


test_run_2 = Test.run do
    source = '
$ \'main\'
 \
  -|
'
    runner = Runner.new(source)
    runner.run
end

test_run_2.ensure do |result|
    assert(result.failure)
    assert(result.error.is_a?(PerpendicularRailCrash))
    assert(result.error.location[:cell] == [3, 2])
end
