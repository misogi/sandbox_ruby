require 'stackprof'
require 'objspace'

StackProf.run(out: "prof.dump") do
  a = (1..10000).to_a.shuffle
end

ObjectSpace.trace_object_allocations_start

ObjectSpace.trace_object_allocations_stop

File.open('memory.json', 'w') do |file|
  ObjectSpace.dump_all(output: file)
end

require 'memory_profiler'

report = MemoryProfiler.report do
  a = [1,2,3]
  b = a.first
  c = b * b
end

report.pretty_print
