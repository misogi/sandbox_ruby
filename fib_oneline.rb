puts 40.times.inject([1, 0]){|h, v| h[v % 2] = h.inject(0, :+); h}[h]
