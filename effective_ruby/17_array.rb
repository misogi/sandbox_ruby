require 'pp'
class Pizza
  def initialize(toppings)
    Array(toppings).each do |topping|
      add_and_price_topping(topping)
    end
  end

  def add_and_price_topping(topping)
    pp topping
  end
end

Pizza.new(['cheese', 'sarmon'])
Pizza.new(1)
Pizza.new(nil)
Pizza.new({a: 1, b: 2})
