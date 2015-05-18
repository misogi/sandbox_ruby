

begin
rescue ArgumentError, LocalJumpError, NoMethodError, ZeroDivisionError
rescue NetError => e
  puts 'net'
rescue DbError => e
  puts 'db'
end
