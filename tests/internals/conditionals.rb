require_relative '../test'

Test.require do
    require_relative '../../runner'
end

CASES = [
    # Function, stack before, stack after
    ["g", ['1', '2'], ['1']],
    ["g", ['2', '2'], ['0']],
    ["g", ['-10', '-2'], ['1']],
    ["g", ['-5', '-5'], ['0']],
    ["g", ['-8', '-5'], ['0']],
    ["g", ['0', '0'], ['0']],
]

CASES.each do |test_case|

    test_run = Test.run do
        stack = test_case[1]
        c = Cell.from_glyph(test_case[0], 0, 0)
        c.activate(nil, nil, stack, nil)
    end

    test_run.ensure do |result|
        assert(result.success)
        assert(result.value == test_case[2])
    end

end
