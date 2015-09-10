input_lines = gets.to_i
water, coffee = 0.0, 0.0
input_lines.times do
  operation, gram = gets.chomp.split(" ").map(&:to_i)
  if operation == 1
    water = water + gram
  elsif operation == 2
    coffee = coffee + gram
  elsif operation == 3
    total = water + coffee
    water = water - (gram * water / total)
    coffee = coffee - (gram * coffee / total)
  end
end

percent = coffee / (coffee + water) * 100
print percent.to_i
