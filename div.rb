def divisors(n)
  [1] + (2..(n / 2)).select { |d| n % d == 0 } + [n]
end

p divisors(1)
