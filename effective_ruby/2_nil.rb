def fix_title(t)
  t.to_s.capitalize
end

puts fix_title('title')
puts fix_title(nil)

puts nil.to_a.reverse
puts [nil, nil, nil].compact.join(',')
puts [nil, nil, nil].join(',')