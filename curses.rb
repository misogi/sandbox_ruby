require 'curses'

include Curses

init_screen
begin
  s = 'Helo World!'
  setpos(lines / 2, cols / 2 - (s.length / 2))
  addstr(s)
  refresh
  getch
ensure
  close_screen
end
