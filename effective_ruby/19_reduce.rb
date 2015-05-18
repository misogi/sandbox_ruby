require 'pp'

def sum(enum)
  enum.reduce(0) do |accum, elem|
    accum + elem
  end
end

def sum2(enum)
  enum.reduce(0, &:+)
end

a = [1,2,3,4]
puts sum a
puts sum2 a

a = ['alice', 'bob', 'cathy']

pp Hash[a.map {|x| [x, true]}]
hh = a.reduce({}) do |h, e|
  h.update(e => true)
end

pp hh

users = [1, 22, 25, 33, 2, 12]

pp users.select {|u| u >= 21}.map(&:to_s)
uu = users.reduce([]) do |names, user|
  names << user if user >= 21
  names
end
pp uu
