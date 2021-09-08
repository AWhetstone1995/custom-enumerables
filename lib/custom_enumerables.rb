module Enumerable
  def my_each
    if block_given?
      for el in self
        yield el
      end
      self
    else
      to_enum(:my_each)
    end
  end

  def my_each_with_index
    for i in 0..(self.size - 1) do
      yield self[i], i
    end
    self
  end

  def my_select(&block)
    output = is_a?(Hash) ? {} : []

    case self
    when Array
      my_each { |item| output.push(item) if block.call(item) }
      output
    when Hash
      my_each { |k, v| output[k] = v if block.call(k, v)}
      output
    end
  end

  def my_all?
    if block_given?
      case self
      when Array
        my_each do |item|
          return false unless yield(item)
        end
      when Hash
        my_each do |k,v|
          return false unless yield(k,v)
        end
      end
    end
    true
  end

  def my_any?
    if block_given?
      case self
      when Array
        my_each do |item|
          return true unless yield(item)
        end
      when Hash
        my_each do |k,v|
          return true unless yield(k,v)
        end
      end
    end
    false
  end

  def my_none?(pattern = nil)
    if block_given?
    #   case self
    #   when Array
      my_each { |item| return false if yield(item) }
    #   when Hash
    #     my_each { |k, v| return false if yield(k, v) }
    #   end
      true
    elsif pattern
      my_each { |el| return false if pattern === el }
    end
  end

  def my_count(pattern = nil)
    count = 0
    if block_given?
      my_each { |item| count += 1 if yield(item) }
    elsif pattern
      my_each { |item| count += 1 if pattern === item }
    end
    count
  end
end

array = [1, 2, 3, 4, 5]
hash = {:a=>1, :b=>2, :c=>3, :d=>4, :e=>5}
# numbers.my_each { |item| puts item}
# numbers.each { |item| puts item }
# p hash.my_each {|k,v| v }
# p hash.my_each { |k, v| hash[k] += v }

# p numbers.my_each_with_index { |item, i| numbers[i] += item }

# p hash.my_select { |k, v| v.odd? }
# p array.my_select { |number| number.odd? }

# p numbers.each_with_index { |number, index| numbers[index] += number }
# p array.my_all? {|number| number >= 1}
# p hash.my_all? {|k, v| v > 1}

# p hash.my_any? { |k, v| v > 1 }

# p hash.count { |k, v| v.even? }

# p array.my_none? { |number| number.zero? }

# p hash.my_none? { |k, v| v > 0 }

# p array.my_none?(Integer)

p array.my_count { |number| number.even?}
p array.my_count(Integer)