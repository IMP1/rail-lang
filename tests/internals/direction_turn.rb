require_relative '../test'

Test.require do
    require_relative '../../direction'
end

test_run_1 = Test.run do
    Direction.turn(Direction::EAST, 1)
end
test_run_1.ensure do |result|
    assert(result.value == Direction::SOUTH_EAST)
end


test_run_2 = Test.run do
    Direction.turn(Direction::EAST, -1)
end
test_run_2.ensure do |result|
    assert(result.value == Direction::NORTH_EAST)
end


test_run_3 = Test.run do
    Direction.turn(Direction::EAST, -7)
end
test_run_3.ensure do |result|
    assert(result.value == Direction::SOUTH_EAST)
end


test_run_4 = Test.run do
    Direction.turn(Direction::EAST, 7)
end
test_run_4.ensure do |result|
    assert(result.value == Direction::NORTH_EAST)
end