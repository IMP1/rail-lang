require_relative '../test'

source = '
$ \'main\'
 \        --[2]-o-#
  \      /
   -[1]-<
         \
          --[3]-o-#
'

runner = nil

Test.require do

    require_relative '../../runner'
    runner = Runner.new(source)

end

$verbose = true

test_run = Test.run do
    runner.run
end

test_run.ensure do |result|
    assert(result.success)
    assert(result.output.chomp == "3")
end
