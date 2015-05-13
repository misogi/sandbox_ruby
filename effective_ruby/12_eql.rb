require 'pp'

class Color
  attr_accessor :name
  def initialize(c)
    @name = c
  end
  
  def hash
    name.hash
  end
  
  def eql?(other)
    name.eql?(other.name)
  end
end

a=Color.new('pink')
b=Color.new('pink')
h={a => 'like', b => 'love'}
pp h

pp /er/ === 'Tyler'
pp /er/ == 'Tyler'
pp Array === [1]
pp Array == [1]
pp [1] === Array