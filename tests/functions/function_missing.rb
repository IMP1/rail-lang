require_relative '../test'

Test.require do

    require_relative '../../runner'

end

test_run_1 = Test.run do
    source = '
$ \'main\'
 \
  \-[Printing from main.\n\]o-{other-function}-#
'
    runner = Runner.new(source)
    runner.run
end

test_run_1.ensure do |result|
    assert(result.failure)
    assert(result.error.is_a?(UndefinedFunctionCrash))
end


test_run_2 = Test.run do
    source = '
$ \'main\'
 \
  \-[Printing from main.\n\]o-{other-function}-#

$ \'other-function-misspelled\'
 \
  \-[Printing from other-function.\n\]o-#
'
    runner = Runner.new(source)
    runner.run
end

test_run_2.ensure do |result|
    assert(result.failure)
    assert(result.error.is_a?(UndefinedFunctionCrash))
end
