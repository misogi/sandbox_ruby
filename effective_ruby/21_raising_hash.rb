require 'forwardable'

class RaisingHash
  extend Forwardable
  include Enumerable
  def_delegators(:@hash, :[], :[]=, :delete, :each, :keys, :values,:length, :empty?, :key?)
  
  def initialize 
    @hash = Hash.new do |hash, key|
      raise(KeyError, "invalid key #{key}!")
    end
  end
  
  def initialize_copy(other)
    @hash = @hash.dup
  end
  
  def freeze
    @hash.freeze
    super
  end
  
  def invert
    other = self.class.new
    other.replace!(@hash.invert)
    other
  end
  
  protected
  
  def replace!(hash)
    hash.default_proc = @hash.default_proc
    @hash = hash
  end
end