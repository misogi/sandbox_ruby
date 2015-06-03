module A
  def who_am_i?
    "A#whoami"
  end
end

module B
  def who_am_i?
    "B#who_am_i?"
  end
end

class C
  prepend A
  prepend B

  def who_am_i?
    "C#who_am_i?"
  end
end

require 'pp'

pp C.ancestors
pp C.new.who_am_i?
