require_relative '../test'

Test.require do

    require_relative '../../runner'

end

test_run_1 = Test.run do
    ARGV = [3]
    source = '
$ \'main\'
 \   
  --i-{countdown}-#

$ \'countdown\'
 \
  \                /-(a)-o--1-(a)-s-{countdown}-#
   -(!a!)-(a)-0-q-<
                   \--0--o-#
'
    runner = Runner.new(source, __FILE__ + "/test_run_1")
    runner.run
end

test_run_1.ensure do |result|
    assert(result.success)
    assert(result.output == "3210")
end



test_run_2 = Test.run do
    ARGV = [4]
    source = '
$ \'main\'
 \   
  --i-{countdown}-#

$ \'countdown\'
 \
  \                /-(a)-o-1-(a)-s-{countdown}-#
   -(!a!)-(a)-0-q-<
                   \--0--o-#
'
    runner = Runner.new(source, __FILE__ + "/test_run_2")
    runner.run
end

test_run_2.ensure do |result|
    assert(result.success)
    assert(result.output == "43210")
end
