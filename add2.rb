(10..26).each do |a|
  b = 36 - a
  answer = 101 * a + 10 * b
  if answer == 1725
    puts "answer is #{b}"
  end
end
