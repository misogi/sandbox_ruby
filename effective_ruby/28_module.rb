module SuperForwardable
  def self.extended(klass)
    require('forwardable')
    klass.extend(Forwardable)
  end

  def def_delegators_with_super(target, *methods)
    methods.each do |method|
      target_method = "#{method}_without_super".to_sym
      def_delegator(target, method, target_method)
      define_method(method) do |*args, &block|
        send(target_method, *args, &block)
        super(*args, &block)
      end
    end
  end
end

class RaisingHash
  extend SuperForwardable

  def_delegators :@hash, :[], :[]=
  def_delegators_with_super :@hash, :freeze, :taint, :untaint

  def initialize
    @hash = {}
  end
end

module PreventInheritance
  class InheritanceError < StandardError; end

  def inherited(child)
    raise(InheritanceError, "#{child} cannnot inherit from #{self}")
  end
end

module Hoge
  def fuge
  end
end

class InstanceMethodWatcher
  def self.method_added(m)
    puts "add #{m}"
  end

  def self.method_removed(m)
    puts "remove #{m}"
  end

  def self.method_undefined(m)
    puts "undefined #{m}"
  end

  def hello; end
  remove_method(:hello)
  def hello; end
  undef_method(:hello)

end

class SingletnMethodWatcher
  def self.singleton_method_added(m)
    puts "add #{m}"
  end

  def self.singleton_method_removed(m)
    puts "remove #{m}"
  end

  def self.singleton_method_undefined(m)
    puts "undefined #{m}"
  end

  def self.hello
  end

  class << self
    remove_method(:hello)

    def hello
    end

    undef_method(:hello)
  end

  include Hoge
  extend Hoge
end

require 'pp'
h = RaisingHash.new
h.freeze
