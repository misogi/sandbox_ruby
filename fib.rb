a = [1, 0]
n = 40

n.times do |n|
  a[n % 2] = a[0] + a[1]
end

puts a[(n - 1) % 2]
