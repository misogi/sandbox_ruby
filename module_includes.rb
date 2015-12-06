require 'active_support'
module Second
  def self.included(base)
    base.extend ClassMethods
  end

  def second_instance_method; '2 instance';end

  module ClassMethods
    def second_class_method; '2 class';end
  end
end

module First
  def self.included(base)
    base.extend ClassMethods
  end

  def first_instance_method;'1 instance';end

  module ClassMethods
    def first_class_method;'1 class';end
  end

  include Second
end

module MyConcern
  extend ActiveSupport::Concern

  def an_instance_method;'C instance'; end

  module ClassMethods
    def a_class_method;'C class';end
  end
end

class BaseClass
  include First
  include MyConcern
end

b = BaseClass.new
puts b.first_instance_method
puts b.second_instance_method
puts BaseClass.first_class_method
puts First.second_class_method
puts b.an_instance_method
puts BaseClass.a_class_method
puts BaseClass.ancestors
puts BaseClass.second_class_method
