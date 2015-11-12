require 'pp'

# 欲しい答えを入れよう
answer = 1724

numbers = [1,2,3,4,5,6,7,8]
sums = {}
patterns = {}
numbers.combination(4).each do |c|
  a = c.inject(:+)
  other = numbers - c
  b = other.inject(:+)
  sum = 100 * b + 10 * a + b
  sums[sum] = [a, b]
  patterns[a] ||= []
  patterns[a].push([c, other])
end

ans_sum = sums[answer]
if !ans_sum
  puts '答えはありません'
  puts '答えは以下のどれかです'
  puts sums.keys.join(',')
  exit
end

puts "#{answer} = #{ans_sum[0]} + #{ans_sum[1]}"
pp patterns[ans_sum[0]]
