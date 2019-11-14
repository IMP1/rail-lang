require_relative '../test'

Test.require do

    require_relative '../../runner'

end

test_run_1 = Test.run do
    source = '
$ \'main\'
 \
  \-[hello ]-(!h!)-[world\n\]-(!w!)-\
                                    |
   /--------------------------------/
   |
   \
  /--&-(w)-o-#
  |
  \-(!l!)-(h)-o-(l)-{}-#
'
    runner = Runner.new(source)
    runner.run
end

test_run_1.ensure do |result|
    assert(result.success)
    assert(result.output == "hello world\n")
end



test_run_2 = Test.run do
    source = '
$ \'main\'
 \
  \-[hello ]-(!h!)-[world\n\]-(!w!)-\
                                    |
   /--------------------------------/
   |
   \
  /--&-(h)-o-#
  |
  \-(!l!)-(l)-{}-(w)-o-#
'
    runner = Runner.new(source)
    runner.run
end

test_run_2.ensure do |result|
    assert(result.success)
    assert(result.output == "hello world\n")
end
