require_relative '../test'

Test.require do

    require_relative '../../runner'

end

test_run_1 = Test.run do
    source = '
$ \'main\'
 \
  ---n1:2:3:2:4:1:-0-\
                    /---&a#
                    |
                    \--{list-reduce}---o---#
'
    runner = Runner.new(source, "string-lib.rl")
    runner.run
end

test_run_1.ensure do |result|
    assert(result.success)
    assert(result.output == [1, 2, 3, 2, 4, 1].sum.to_s)
end

