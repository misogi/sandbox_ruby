module OnlySpace
  ONLY_SPACE_UNICODE_RE = %r/\A[[:space:]]*\z/

  def self.only_space?(str)
    if str.ascii_only?
      !str.bytes.any? {|b| b != 32 && !b.between?(9,13)}
    else
      ONLY_SPACE_UNICODE_RE === str
    end
  end
end

module OnlySpaceExt
  def only_space?
    OnlySpace.only_space?(self)
  end
end

require 'forwardable'

class StringExtra
  extend(Forwardable)
  def_delegators(:@string, *String.public_instance_methods(false))

  def initialize(str='')
    @string = str
  end

  def only_space?
    true
  end
end

module OnlySpace
  refine(String) do
    def only_space?
      'space!'
    end
  end
end

class Person
  using(OnlySpace)

  def initialize(str='')
    @name=str
  end

  def valid?
    @name.only_space?
  end
end

puts OnlySpace.only_space?("\r\n")

str = 'Yo Ho!'
str.extend(OnlySpaceExt)

puts str.only_space?

str = StringExtra.new('hogeHoge')
puts str.only_space?
puts str.upcase

p = Person.new('person')
puts p.valid?
