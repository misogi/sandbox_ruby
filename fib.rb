a = [1, 0]
n = 40

n.times do |i|
  a[i % 2] = a.inject(:+)
end

puts a[(n - 1) % 2]
