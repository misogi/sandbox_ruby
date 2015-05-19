
def tricky
  return 'horses'
ensure
  return 'ponies'
end

def explicit
  raise StandardError, 'hoge'
  return 'horses'
rescue StandardError => e
  puts 'error'
  return 'ponies'
ensure
  puts 'clean up'
end

def loopy
  [1,2,3].each do |i|
    begin
      puts i
      raise StandardError, 'hey'
    ensure
      next
    end
 end
end

puts tricky
puts explicit
loopy
