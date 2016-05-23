def find_reverse(word, index, d)
  reverse_word = word.reverse
  first_char = reverse_word[0]
  is_kaibun = first_char == word[0]
  d[first_char].each_with_index do |dst, i|
    next if is_kaibun && i == index
    if reverse_word == dst
      d[word[0]][index] = d[first_char][i] = ''
      return true
    end
  end
  false
end

number = gets.chomp.to_i
dictionary = {}
('a'..'z').each do |c|
  dictionary[c] = []
end

number.times do
  word = gets.chomp
  dictionary[word[0]] << word
end

dictionary.each do |key, words|
  words.sort!
end

center = nil
left = ''
dictionary.each do |key, words|
  words.each_with_index do |word, i|
    next if word == ''
    if find_reverse(word, i, dictionary)
      left << word
    elsif word == word.reverse
      center = word if center.nil?
      dictionary[key][i] = ''
    end
  end
end

print left, center, left.reverse, "\n"
