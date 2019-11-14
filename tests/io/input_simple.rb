require_relative '../test'

Test.require do

    require_relative '../../runner'
    ARGV = [1]

end

test_run = Test.run do
    source = '
$ \'main\'
 \
  \-i-o-#
'
    runner = Runner.new(source)
    runner.run
end

test_run.ensure do |result|
    assert(result.success)
    assert(result.output.chomp == "1")
end
