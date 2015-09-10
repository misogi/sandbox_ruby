def sum_div(num)
  sum = 0
  (1..num).each do |i|
    sum += i if num % i == 0
  end
  sum
end

s = sum_div(16) - sum_div(25)
p s

(1..30).each do |b|
  p b if sum_div(b) == 24
end
