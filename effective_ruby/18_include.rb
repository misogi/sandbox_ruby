require 'set'

class Role
  def initialize(name, permissions)
    @name, @permissions = name, permissions
  end

  def can?(permission)
    @permissions.include?(permission)
  end
end

class Roleh
  def initialize(name, permissions)
    @name = name
    @permissions = Hash[permissions.map {|p| [p, true]}]
  end

  def can?(permission)
    @permissions.include?(permission)
  end
end

class Roles
  def initialize(name, permissions)
    @name, @permissions = name, Set.new(permissions)
  end

  def can?(permission)
    @permissions.include?(permission)
  end
end

ps = ['a', 'b', 'c', 'd']
puts Role.new('role', ps).can? 'a'
puts Roleh.new('role', ps).can? 'a'
puts Roles.new('role', ps).can? 'a'
