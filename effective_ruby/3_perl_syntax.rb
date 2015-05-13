puts 'hoge' =~ /^ho/
puts 'hoge' =~ /m/

puts 'hoge'.match(/^ho/)

puts $:
puts $LOAD_PATH

require 'English'

puts $OUTPUT_FIELD_SEPARATOR
puts $LOADED_FEATURES, $POSTMATCH, $PID