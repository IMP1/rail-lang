require_relative '../test'

Test.require do

    require_relative '../../runner'

end

test_run_1 = Test.run do
    source = '
$ \'main\'
 \
  ---[hello world]-{string-chars}-\
                                 /--&-o-[\n\]-o-#
                               @---{list-each}-#
'
    runner = Runner.new(source, "string-lib.rl")
    runner.run
end

test_run_1.ensure do |result|
    assert(result.success)
    assert(result.output.chomp == "hello world".split("").join("\n"))
end


test_run_2 = Test.run do
    source = '
$ \'main\'
 \
  ---[hello world]-{string-chars}-\
                                 /--&-[_]p-#
                               @---{list-map}-o-#
'
    runner = Runner.new(source, "string-lib.rl")
    runner.run
end

test_run_2.ensure do |result|
    assert(result.success)
    assert(result.output.chomp == "hello world".split("").map { |char| char + "_"}.inspect)
end