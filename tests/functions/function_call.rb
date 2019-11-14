require_relative '../test'

Test.require do

    require_relative '../../runner'

end

test_run_1 = Test.run do
    source = '
$ \'main\'
 \
  \-[Printing from main.\n\]-o-{other-function}-#

$ \'other-function\'
 \
  \---[Printing from other-function.\n\]-o-#
'
    runner = Runner.new(source)
    runner.run
end

test_run_1.ensure do |result|
    assert(result.success)
    assert(result.output == "Printing from main.\nPrinting from other-function.\n")
end
