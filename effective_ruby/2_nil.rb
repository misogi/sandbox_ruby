def fix_title(t)
  t.to_s.capitalize
end

puts fix_title('title')
puts fix_title(nil)