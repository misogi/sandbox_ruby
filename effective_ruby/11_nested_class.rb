# error
# class Notebooks::Page
# end

module Notebooks
  KEY = 'pass1234'
  class Binding
    def initialize(key=KEY)
      @key = key
      puts key
    end
  end
  
  class Array
    def initialize(n)
      @disks = ::Array.new(n) {|i| "disk#{n}"}
    end
  end
end

class Notebooks::Page
  def initialize
    puts Notebooks::KEY
  end
end

x=Notebooks::Binding.new
y=Notebooks::Page.new
a=Notebooks::Array.new(4)

puts x
puts y
puts a