require 'logger'

class HashProxy
  Hash.public_instance_methods(false).each do |name|
    define_method(name) do |*args, &block|
      @hash.send(name, *args, &block)
    end
  end

  def initialize
    @hash = {}
  end

  def respond_to_missing? (name, include_private)
    @hash.respond_to?(name, include_private) || super
  end
end

class AuditDecorator
  def initialize(object)
    @object = object
    @logger = Logger.new($stdout)

    object.public_methods.each do |name|
      define_singleton_method(name) do |*args, &block|
        @logger.info("calling #{name} on #{@object.inspect}")
        @object.send(name, *args, &block)
      end
    end
  end

  private

  def method_missing(name, *args, &block)
    @logger.info("OLD: calling #{name} on #{@object.inspect}")
    @object.send(name, *args, &block)
  end
end

require 'pp'

h = HashProxy.new
h[:hoge] = 32
puts h
puts h.respond_to?(:size)
pp h.public_methods(false).sort.take(5)
fake = AuditDecorator.new('I am a String')

pp fake.downcase
pp fake.respond_to?(:downcase)
pp fake.class
