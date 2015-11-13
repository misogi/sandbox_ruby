a = [1, 0]
n = 40
fib = 0

n.times do |n|
  fib = a.inject(0, :+)
  a[n % 2] = fib
end

puts fib
