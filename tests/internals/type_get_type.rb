require_relative '../test'

Test.require do
    require_relative '../../type'
end

test_run_1 = Test.run do
    Type.get_type("hello")
end
test_run_1.ensure do |result|
    assert(result.success)
    assert(result.value == TYPE::STRING)
end


test_run_2 = Test.run do
    Type.get_type([])
end
test_run_2.ensure do |result|
    assert(result.success)
    assert(result.value == TYPE::NIL)
end


test_run_3 = Test.run do
    Type.get_type(["1", "3"])
end
test_run_3.ensure do |result|
    assert(result.success)
    assert(result.value == TYPE::LIST)
end



test_run_3 = Test.run do
    Type.get_type({})
end
test_run_3.ensure do |result|
    assert(result.success)
    assert(result.value == TYPE::LAMBDA)
end

