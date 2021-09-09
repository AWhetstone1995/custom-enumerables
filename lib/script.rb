require_relative 'custom_enumerables'

# my_each vs each
arr = [1, 2, 3, 4, 5]
hash = {:a=>1, :b=>2, :c=>3, :d=>4, :e=>5}
puts '----my_each----'
p (arr.my_each { |number| puts number })
p (hash.my_each { |k, v| hash[k] = v * 2 })
puts "\n"
arr = [1, 2, 3, 4, 5]
hash = {:a=>1, :b=>2, :c=>3, :d=>4, :e=>5}
puts '----each----'
p (arr.each { |number| puts number })
p (hash.each { |k, v| hash[k] = v * 2 })
puts "\n"

# my_each_with_index vs each_with_index
arr = [1, 2, 3, 4, 5]
hash = {:a=>1, :b=>2, :c=>3, :d=>4, :e=>5}
puts '----my_each_with_index----'
p (arr.my_each_with_index { |number, i| arr[i] += number })
puts "\n"
arr = [1, 2, 3, 4, 5]
hash = {:a=>1, :b=>2, :c=>3, :d=>4, :e=>5}
puts '----each_with_index----'
p (arr.each_with_index { |number, i| arr[i] += number })
puts "\n"

# my_select vs select
arr = [1, 2, 3, 4, 5]
hash = {:a=>1, :b=>2, :c=>3, :d=>4, :e=>5}
puts '----my_select----'
p (hash.my_select { |k, v| v.odd? })
p (arr.my_select { |number| number.odd? })
puts "\n"
arr = [1, 2, 3, 4, 5]
hash = {:a=>1, :b=>2, :c=>3, :d=>4, :e=>5}
puts '----select----'
p (hash.select { |k, v| v.odd? })
p (arr.select { |number| number.odd?})
puts "\n"

# my_all vs all
arr = [1, 2, 3, 4, 5]
hash = {:a=>1, :b=>2, :c=>3, :d=>4, :e=>5}
puts '----my_all----'
p (arr.my_all? {|number| number.is_a?(Integer) })
p (hash.my_all? {|k, v| v > 1 })
puts "\n"
arr = [1, 2, 3, 4, 5]
hash = {:a=>1, :b=>2, :c=>3, :d=>4, :e=>5}
puts '----all----'
p (arr.all? {|number| number.is_a?(Integer) })
p (hash.all? {|k, v| v > 1 })
puts "\n"

# my_any vs any
arr = [1, 2, 3, 4, 5]
hash = {:a=>1, :b=>2, :c=>3, :d=>4, :e=>5}
puts '----my_any----'
p (arr.my_any? {|number| number.is_a?(Integer) })
p (hash.my_any? {|k, v| v > 1 })
puts "\n"
arr = [1, 2, 3, 4, 5]
hash = {:a=>1, :b=>2, :c=>3, :d=>4, :e=>5}
puts '----all----'
p (arr.any? {|number| number.is_a?(Integer) })
p (hash.any? {|k, v| v > 1 })
puts "\n"

# my_none vs none
arr = [1, 2, 3, 4, 5]
hash = {:a=>1, :b=>2, :c=>3, :d=>4, :e=>5}
puts '----my_none----'
p (arr.my_none? {|number| number.is_a?(Integer) })
p (hash.my_none? {|k, v| v > 1 })
puts "\n"
arr = [1, 2, 3, 4, 5]
hash = {:a=>1, :b=>2, :c=>3, :d=>4, :e=>5}
puts '----none----'
p (arr.none? {|number| number.is_a?(Integer) })
p (hash.none? {|k, v| v > 1 })
puts "\n"

# my_count vs count
arr = [1, 2, 3, 4, 5]
hash = {:a=>1, :b=>2, :c=>3, :d=>4, :e=>5}
puts '----my_count----'
p (arr.my_count { |number| number.even? })
p (hash.my_count { |k, v| v > 1})
puts "\n"
arr = [1, 2, 3, 4, 5]
hash = {:a=>1, :b=>2, :c=>3, :d=>4, :e=>5}
puts '----count----'
p (arr.count { |number| number.even? })
p (hash.count { |k, v| v > 1 })
puts "\n"

# my_map vs map
arr = [1, 2, 3, 4, 5]
hash = {:a=>1, :b=>2, :c=>3, :d=>4, :e=>5}
puts '----my_map----'
p (arr.my_map { |number| number * 2 })
p (arr.my_map { |number| number * 4})
puts "\n"
arr = [1, 2, 3, 4, 5]
hash = {:a=>1, :b=>2, :c=>3, :d=>4, :e=>5}
puts '----map----'
p (arr.map { |number| number * 2 })
p (arr.map { |number| number * 4})
puts "\n"

# my_inject vs inject
arr = [1, 2, 3, 4, 5]
hash = {:a=>1, :b=>2, :c=>3, :d=>4, :e=>5}
puts '----my_inject----'
p (arr.my_inject { |sum, n| sum * n })
p (arr.my_inject(1) { |sum, n| sum * n})
puts "\n"
arr = [1, 2, 3, 4, 5]
hash = {:a=>1, :b=>2, :c=>3, :d=>4, :e=>5}
puts '----inject----'
p (arr.inject { |sum, n| sum * n })
p (arr.inject(1) { |sum, n| sum * n})
puts "\n"
