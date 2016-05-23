require 'io/console'

loop do
  c = STDIN.getch
  exit if c == "\C-c"
  print c.dump
end
