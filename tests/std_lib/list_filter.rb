require_relative '../test'

Test.require do

    require_relative '../../runner'

end

test_run_1 = Test.run do
    source = '
$ \'main\'
 \
  ---n1:2:3:2:4:1:---\
                    /---&-2qfq-#
                    |
                    \-{list-filter}---o---#
'
    runner = Runner.new(source, "string-lib.rl")
    runner.run
end

test_run_1.ensure do |result|
    assert(result.success)
    assert(result.output == %w[1 4 2 3 2 1].select { |i| i != "2" }.inspect)
end

