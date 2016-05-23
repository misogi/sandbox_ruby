a = 5 * 6 * 7 * 8

(1..2000).each do |i|
  b = a * i
  if 2004000 <= b && 2005000 > b
    p b
  end
end
