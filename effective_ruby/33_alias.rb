module LogMethod
  def log_method(method)
    orig = "#{method}_without_logging".to_sym
    if instance_methods.include?(orig)
      raise(NameError, "#{orig} isnt unique name")
    end

    alias_method(orig, method)

    define_method(method) do |*args, &block|
      $stdout.puts("calling method #{method}")
      result = send(orig, *args, &block)
      $stdout.puts("#{method} returns #{result.inspect}")
      result
    end
  end

  def unlog_method(method)
    orig = "#{method}_without_logging".to_sym
    unless instance_methods.include?(orig)
      raise(NameError, "was #{orig} already removed?")
    end

    remove_method(method)

    alias_method(method, orig)

    remove_method(orig)
  end
end

Array.extend(LogMethod)
Array.log_method(:first)
[1,2,3].first
%w(a b c).first_without_logging
Array.unlog_method(:first)
[3,4].first
