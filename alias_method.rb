require 'pp'
module Greetings
  def greet
    'hello'
  end
end

module EnthusiasticGreetings
  def greet
    "HEY, #{super}!!"
  end
end


class MyClass
  include Greetings

  def greet_with_enthusiasm
    "hey, #{greet_without_enthusiasm}"
  end

  alias_method :greet_without_enthusiasm, :greet
  alias_method :greet, :greet_with_enthusiasm
end

class GreetClass
  include Greetings
  include EnthusiasticGreetings
end

c = MyClass.new
puts c.greet
puts c.greet_with_enthusiasm
puts c.greet_without_enthusiasm
gc = GreetClass.new
puts gc.greet
pp GreetClass.ancestors
