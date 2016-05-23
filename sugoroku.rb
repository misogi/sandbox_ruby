length = gets.chomp.to_i
grids = gets.chomp.split(" ").map(&:to_i)
dice_num = gets.chomp.to_i
dice_num.times do
  turn = 0
  dice = gets.chomp.to_i
  move = grids[dice]
  while move != 0 && turn < length && grids[dice]
    dice += move
    move = grids[dice]
    turn += 1
  end
  puts grids.size == dice + 1 ? 'Yes' : 'No'
end
