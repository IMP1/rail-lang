require_relative '../test'

Test.require do

    require_relative '../../runner'
    ARGV = [3]

end

test_run_1 = Test.run do
    source = '
$ \'main\'
 \   
  --i-{countdown}-#

$ \'countdown\'
 \
  \                /-(a)-o--1-(a)-s-{main}-#
   -(!a!)-(a)-0-q-<
                   \--0--o-#
'
    runner = Runner.new(source)
    runner.run
end

test_run_1.ensure do |result|
    assert(result.success)
    assert(result.output == "3210")
    puts "Output:"
    puts result.output
end
