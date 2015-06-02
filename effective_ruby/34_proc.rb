require 'pp'
def pass(&block) block; end

g = pass {|name| "Hello #{name}"}
pp g.lambda?
pp g.arity
puts g.call('world')

def test
  yield('a')
end

def la(&block)
  block.lambda?
end

pp test {|x,y,z| [x,y,z]}
pp test {'b'}

func = ->(x) {"Hello #{x}"}
pp func.lambda?
func.call('a')

pp la(& ->(x){x})

class Stream
  def initialize(io=$stdin, chunk=64*1024)
    @io, @chunk = io, chunk
  end

  def stream(&block)
    loop do
      start = Time.now
      data = @io.read(@chunk)
      return if data.nil?

      argc = block.arity
      args = [data]

      if (argc == 2 || ~argc == 2)
        args << (Time.now - start).to_f
      end

      block.call(*args)
    end
  end
end

def file_size(file)
  File.open(file) do |f|
    bytes = 0
    s = Stream.new(f)
    s.stream {|data| bytes += data.size }

    bytes
  end
end

pp func = ->(x, y=1) {x+y}
pp func.arity
pp ~ func.arity

require 'digest'

def digest(file)
  File.open(file) do |f|
    sha = Digest::SHA256.new
    s = Stream.new(f)
    s.stream(&sha.method(:update))
    sha.hexdigest
  end
end

pp file_size('33_alias.rb')
pp digest('33_alias.rb')
