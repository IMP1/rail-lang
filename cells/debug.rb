Cell.create("Debug", '`') do |cell, world, train, stack, env|
    $debug = false if $debug.nil?
    $debug = !$debug
    puts "DEBUG " + ($debug ? "ON" : "OFF")
    if $debug
        p env
    end
end
