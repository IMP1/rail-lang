require_relative '../test'

Test.require do

    require_relative '../../runner'

end

test_run_1 = Test.run do
    source = '
$ \'main\'
 \
  --[1\]\]-o-#
'
    runner = Runner.new(source, __FILE__ + "/test_run_1")
    runner.run
end

test_run_1.ensure do |result|
    assert(result.success)
    assert(result.output.chomp == "1]")
end


test_run_2 = Test.run do
    source = '
$ \'main\'
 \
  --[1\\\\]-o-#
'
    runner = Runner.new(source, __FILE__ + "/test_run_2")
    runner.run
end

test_run_2.ensure do |result|
    assert(result.success)
    assert(result.output.chomp == "1\\")
end


test_run_3 = Test.run do
    source = '
$ \'main\'
 \
  --[1\n\2]-o-#
'
    runner = Runner.new(source, __FILE__ + "/test_run_3")
    runner.run
end

test_run_3.ensure do |result|
    assert(result.success)
    assert(result.output.chomp == "1\n2")
end
