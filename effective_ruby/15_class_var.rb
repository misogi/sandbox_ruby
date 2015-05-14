require 'byebug'

class Singleton
  private_class_method :new, :dup, :clone
  def self.instance
    @single ||= new
  end

  def ins
    @single
  end
end

class Configuration < Singleton
end

class Database < Singleton
end
