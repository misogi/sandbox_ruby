class CoffeeTooWeakError < StandardError; end

class TemperatureError < StandardError
  attr_reader :temp

  def initialize(temp)
    @temp = temp
    super "inivalid temperature #{@temp}"
  end
end

begin
  raise CoffeeTooWeakError, 'coffee to water ratio too low'
rescue CoffeeTooWeakError
  puts 'catch'
end

raise TemperatureError.new(180)
