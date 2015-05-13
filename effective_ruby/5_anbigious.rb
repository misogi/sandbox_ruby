def add(x,y)
  z=1
  x+y
end

def repeat (n, &block)
n.times{|n| block.call(n)}
end