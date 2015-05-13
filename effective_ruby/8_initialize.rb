class Parent
  attr_accessor :name
  def initialize
    @name = "howard"
  end
end

class Child < Parent
  attr_accessor :grade
  def initialize
    @grade =  8
  end
end

