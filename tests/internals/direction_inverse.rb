require_relative '../test'

Test.require do
    require_relative '../../direction'
end

test_run_1 = Test.run do
    Direction.inverse(Direction::EAST)
end
test_run_1.ensure do |result|
    assert(result.success)
    assert(result.value == Direction::WEST)
end


test_run_2 = Test.run do
    Direction.inverse(Direction::WEST)
end
test_run_2.ensure do |result|
    assert(result.success)
    assert(result.value == Direction::EAST)
end


test_run_2 = Test.run do
    Direction.inverse(Direction::SOUTH_EAST)
end
test_run_2.ensure do |result|
    assert(result.success)
    assert(result.value == Direction::NORTH_WEST)
    assert(result.value != Direction::NORTH)
    assert(result.value != Direction::WEST)
    assert(result.value != Direction::SOUTH_EAST)
end