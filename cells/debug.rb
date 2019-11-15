Cell.create("Debug", '`') do |cell, world, train, stack, env|
    $debug = false if $debug.nil?
    $debug = !$debug
    puts "DEBUG " + ($debug ? "ON" : "OFF")
    p stack if $debug
end
