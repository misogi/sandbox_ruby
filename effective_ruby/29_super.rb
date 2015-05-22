class DownloaderBase
  def self.inherited(subclass)
    super # じゅうよう
    handlers << subclass
    puts handlers
  end

  def self.handlers
    @handlers ||= []
  end

  private_class_method(:handlers)
end

class A < DownloaderBase
end
