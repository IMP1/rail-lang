require_relative '../test'

Test.require do

    require_relative '../../runner'
    require_relative '../../type'

end

test_run_1 = Test.run do
    source = '
$ \'main\'
 \
  --[1]-?-o-#
'
    runner = Runner.new(source)
    runner.run
end

test_run_1.ensure do |result|
    assert(result.success)
    assert(result.output.chomp == Type::STRING)
end


test_run_2 = Test.run do
    source = '
$ \'main\'
 \
  --n-?-o-#
'
    runner = Runner.new(source)
    runner.run
end

test_run_2.ensure do |result|
    assert(result.success)
    assert(result.output.chomp == Type::NIL)
    assert(result.output.chomp != Type::LIST)
end


test_run_3 = Test.run do
    source = '
$ \'main\'
 \
  --1-n-:-?-o-#
'
    runner = Runner.new(source)
    runner.run
end

test_run_3.ensure do |result|
    assert(result.success)
    assert(result.output.chomp == Type::LIST)
end


test_run_4 = Test.run do
    source = '
$ \'main\'
 \
  ----\
       \
    /------&-#
    |
    \--?-o-#

'
    runner = Runner.new(source)
    runner.run
end

test_run_4.ensure do |result|
    assert(result.success)
    assert(result.output.chomp == Type::LAMBDA)
end
