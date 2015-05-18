begin
file = File.open('a.txt', 'w')
ensure
file.close
end

class Lock
  def self.acquire
    lock = new
    lock.exclusive_lock!
    if block_given?
      yield(lock)
    else
      lock
    end
  ensure
    lock.unlock if lock
  end
end

File.open('a.txt', 'w') do |file|

end

Lock.acquire do |lock|
  lock
end
