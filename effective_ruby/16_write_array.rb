require 'pp'

class Tuner
  def initialize(presets)
    @presets = clean(presets)
  end

  private

  def clean!
    @presets.delete_if { |f| f[-1].to_i.even? }
  end

  def clean(presets)
    presets.reject {|f| f[-1].to_i.even? }
  end
end

pp presets = %w(90.1 106.2 88.5)
tuner = Tuner.new(presets)
pp presets

pp a=["polar"]
pp b = a.dup << "bear"
pp c = Marshal.load(Marshal.dump(a)) << 'bears' ## high memory
pp b.each {|x| x.sub!('lar', 'oh')}
pp a
pp c
