answer = (1..10).to_a.sample
message = {
  1 => 'your answer is low',
  -1 => 'your answer is high',
  0 => 'good'
}

loop do
  confirm = gets.to_i
  break unless (1..10).include?(confirm)
  compare = answer <=> confirm
  puts message[compare]
  break if compare == 0
end
