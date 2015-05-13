require 'pp'

NETWORKS = ['a', 'b']
HOSTS = ['d', 'e'].freeze

net = NETWORKS

pp NETWORKS
net.delete_if {|s| s == 'a'}
pp NETWORKS

HOSTS.map{|h| h << '.host'}
pp HOSTS

TIMEOUTS = 5
TIMEOUTS += 5
pp TIMEOUTS

# error
HOSTS.delete('e.host')
pp HOSTS