
class Resource
  def self.open(&block)
    resource = new
    block.call(resource) if block
  ensure
    resource.close if resource
  end

  def initialize
    @resource = allocate_resource
    finalizer = self.class.finalizer(@resource)
    ObjectSpace.define_finalizer(self, finalizer)
  end

  def close
    ObjectSpace.undefine_finalizer(self)
    @resource.close
  end

  def self.finalizer(resource)
    lambda {|id| resource.class}
  end
end
