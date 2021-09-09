module Enumerable
  def my_each
    if block_given?
      for item in self
        yield item
      end
      self
    else
      to_enum(:my_each)
    end
  end

  def my_each_with_index
    for i in 0..length - 1 do
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

  def my_all?(a_proc = nil)
    if block_given?
      my_each { |item| return false unless yield(item) }
      true
    elsif a_proc
      my_each { |item| return false unless a_proc === item }
      true
    end
  end

  def my_any?(a_proc = nil)
    if block_given?
      my_each { |item| return true if yield (item) }
      false
    elsif a_proc
      my_each { |item| return true if a_proc === item }
      false
    end
  end

  def my_none?(a_proc = nil)
    if block_given?
      my_each { |item| return false if yield(item) }
      true
    elsif a_proc
      my_each { |item| return false if a_proc === item }
      true
    end
  end

  def my_count(a_proc = nil)
    count = 0
    if block_given?
      my_each { |item| count += 1 if yield(item) }
    elsif a_proc
      my_each { |item| count += 1 if a_proc === item }
    end
    count
  end

  def my_map(a_proc = nil)
    arr = []
    if a_proc
      my_each { |item| arr.push(a_proc.call(item)) }
    else
      my_each { |item| arr.push(yield(item)) }
    end
    arr
  end

  def my_inject(initial_value = nil)
    accumulator = initial_value ? initial_value : first
    my_each { |item| accumulator = yield(accumulator, item) }
    accumulator
  end
end
