class SetMe
  def value
    @value
  end
  def value=(v)
    @value=v
  end
end

x=SetMe.new
x.value = 1
x.value=(2)

puts x.value