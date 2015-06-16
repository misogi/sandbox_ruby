
require 'memory_profiler'

errors = [1,2,3,4,'F1',2,3,4]
FATAL_CODES = %w(F1 F2 F3).map(&:freeze).freeze

report = MemoryProfiler.report do
  errors.any? {|e| FATAL_CODES.include?(e) }
end

errors.any?{|e| e == 'FATAL'.freeze }

report.pretty_print
