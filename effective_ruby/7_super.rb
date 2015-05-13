class Base
  def m1(x,y)
    puts 'i am base' << x.to_s << y.to_s
  end
end

module Cool
  def m1(x, y)
  puts 'i am cool ' << x.to_s << y.to_s
  end
end

class Derived < Base
  include Cool
  def m1(x, y)
    super(x,y)
    super(3,4)
    super x,y
    super
    # super()
    puts 'iam deliver' << x.to_s
  end
  
  def laugh
  super
  end
end
  
  
d=Derived.new
d.m1(1, 2)
# d.laugh