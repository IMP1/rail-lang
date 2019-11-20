require_relative '../test'

Test.require do

    require_relative '../../runner'

end

test_run_1 = Test.run do
    source = '
$ \'main\'
 \
  ---[var a]-(!a!)-\
                  /--&--(a)-o-#
                @--{other}-#

$ \'other\'
 \
  ---[var b]-(!a!)-{}-#
'
    runner = Runner.new(source, __FILE__ + "/test_run_1")
    runner.run
end

test_run_1.ensure do |result|
    assert(result.success)
    assert(result.output == "var a")
end

