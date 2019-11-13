require_relative '../test'

source = '
$ \'main\'
 \
  \
   --  #
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
    p result
    p result&.error&.backtrace
    assert(!result.success)
end
