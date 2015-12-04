module A
  def self.a_method
     'hello'
   end
end

module B
  def b_method
    'Bhello'
  end
end

module C
  def c_method
    'CHello'
  end
end

class MyClass
  extend B
  class << self
    include A
  end
end

class YouClass
  include B
  include A
end

# puts MyClass.a_method
puts MyClass.b_method
my = MyClass.new
# puts my.a_method
my.extend C
puts my.c_method

# puts YouClass.a_method
# puts YouClass.b_method
you = YouClass.new
puts you.b_method
