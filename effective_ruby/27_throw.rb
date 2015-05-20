a=[[1,2,3],[4,5,6],[7,8,9]]

match = catch(:jump) do
  a.each do |aa|
    aa.each do |aaa|
      puts aaa
      throw(:jump, aaa) if aaa == 5
    end
  end
end

puts match

begin
  a.each do |aa|
    aa.each do |aaa|
      puts aaa
      raise StandardError if aaa == 5
    end
  end
rescue
end
