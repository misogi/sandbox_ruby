require './13_compare'
require 'mrproper'

properties 'version' do
  data([Integer, Integer, Integer])

  property("new(str).to_s == str") do |data|
    str = data.join('.')
    assert_equal(str, Version.new(str).to_s)
  end
end
