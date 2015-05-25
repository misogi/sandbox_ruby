require 'pp'

def glass_case_of_emotion
  x = "I'm in a " + __method__.to_s.tr('_', ' ')
  binding
end

class Widget
  def initialize(name)
    @name = name
  end
end

x = 'scope'

pp eval("x")

pp eval('x', glass_case_of_emotion)

pp w = Widget.new('Muffler')
pp w.instance_eval{@name}
w.instance_eval do
  def in_stock?; false; end
end

pp w.singleton_methods(false)

Widget.instance_eval do
  def table_name; 'widgets'; end
end
Widget.class_eval do
  attr_accessor :name
  def sold?; false; end
end

pp Widget.table_name
pp Widget.singleton_methods(false)

w=Widget.new('blinker')
pp w.public_methods(false)


class Widget2
  attr_accessor :name, :quantity

  def initialize(&block)
    instance_eval(&block) if block
  end
end

w = Widget2.new do |widget|
  widget.name = 'hoge'
  @quantity = 1
end

pp w

class Counter
  DEFAULT = 0
  attr_reader :Counter

  def initialize(start=DEFAULT)
    @counter = start
  end

  def inc
    @counter += 1
  end
end

module Reset
  def self.reset_var(object, name)
    object.instance_exec("@#{name}".to_sym) do |var|
      const=self.class.const_get(:DEFAULT)
      pp var
      instance_variable_set(var, const)
    end
  end
end

c= Counter.new(100)
pp c
Reset.reset_var(c, 'counter')
pp c
Reset.reset_var(c, 'x;')
