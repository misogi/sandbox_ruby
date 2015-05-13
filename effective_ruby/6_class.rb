require 'pp'

module ThingsWithNames
  def name
    puts 'I am Thing'
  end
end

class Person
  include ThingsWithNames
end

class Customer < Person
  def self.where_am_i?
    puts self
    puts 'I am here'
  end
end

c=Customer.new
puts c.class
puts c.respond_to? :name

pp Customer.superclass
pp Person.superclass

def c.name
  puts 'I am a customer'
end

c.name
puts Customer.where_am_i?

pp Customer.singleton_class.instance_methods(false)
pp Person.singleton_class.instance_methods(false)
pp Customer.singleton_class.superclass
pp Customer.singleton_class
pp Customer.ancestors
pp Customer.included_modules
