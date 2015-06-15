require 'pp'
class Version
  include Comparable
  alias_method :eql?, :==

  attr_accessor :major, :minor, :patch
  def initialize(version)
    @major, @minor, @patch = version.split('.').map(&:to_i)
  end

  def <=>(other)
    return nil unless other.is_a?(Version)

    [
      major <=> other.major,
      minor <=> other.minor,
      patch <=> other.patch
    ].detect{|n| !n.zero? } || 0
  end

  def to_s
    [@major, @minor, @patch].join('.')
  end
end

# vs = %w(2.2.1 2.10.1 2.9.1).map{|v| Version.new(v) }
# vs.sort!

# pp vs
# pp vs[1] < vs[2]
