require "byebug"

class MaxIntSet
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    validate!(num)
    @store[num] = true
  end

  def remove(num)
    validate!(num)
    @store[num] = false
  end

  def include?(num)
    validate!(num)
    @store[num]
  end

  private

  def is_valid?(num)
    return false if num < 0 || num >= @store.length
    true
  end

  def validate!(num)
    raise "Out of bounds" unless is_valid?(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    unless @store[num % num_buckets].include?(num)
      @store[num % num_buckets].push(num)
    end
    true
  end

  def remove(num)
    @store[num % num_buckets].reject! { |x| x == num }
  end

  def include?(num)
    return @store[num % num_buckets].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    @count += 1
    resize! if @count > @store.length
    @store[num % num_buckets].push(num)
  end

  def remove(num)
    @count -= 1
    @store[num % num_buckets].reject! { |x| x == num }
  end

  def include?(num)
    return @store[num % num_buckets].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_buckets = Array.new(@store.length * 2) {Array.new}
    @store.each do |bucket|
      bucket.each do |num|
        new_buckets[num % new_buckets.length].push(num)
      end
    end

    @store = new_buckets
  end
end
