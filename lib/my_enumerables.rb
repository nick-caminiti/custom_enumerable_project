module Enumerable
  # Your code goes here

  def my_each_with_index
    return puts 'No block given' unless block_given?
    i = 0
    self.my_each do |v|
      yield(v, i)
      i += 1
    end
    self
  end

  def my_select
    return puts 'No block given' unless block_given?
    selected = []
    self.my_each do |v|
      selected << v if yield(v)
    end
    selected
  end

  def my_all?
    return puts 'No block given' unless block_given?
    all = true
    self.my_each {|v| all = false unless yield(v) }
    all
  end

  def my_any?
    return puts 'No block given' unless block_given?
    any = false
    self.my_each {|v| any = true if yield(v) }
    any
  end

  def my_none?
    return puts 'No block given' unless block_given?
    none = true
    self.my_each {|v| none = false if yield(v) }
    none
  end

  def my_count
    if block_given?
      count = 0
      self.my_each {|v| count += 1 if yield(v) }
      count
    else
      self.length
    end
  end

  def my_map
      mapped_array = []
      self.my_each { |v| mapped_array << yield(v)}
      mapped_array
  end 

  def my_inject(default = 0)
    return puts 'No block given' unless block_given?
    accumulator = default
    self.my_each do |v|
      accumulator = yield(accumulator, v)
    end
    accumulator
  end
end

class Array
  # Define my_each here
  def my_each
    return puts 'No block given' unless block_given?
    i = 0
    while i < self.length
      yield self[i]
      i += 1
    end
    self
  end
end

array = [5,9,69]

# p array.my_inject(0) { |sum, value| sum + value }


# array.my_all? { |n| n > 4 }

# selected = array.my_select { |n| n > 8 }