require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  attr_reader :count
  self.extend(Enumerable)

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    @store[key.hash % num_buckets].include?(key)
  end

  def set(key, val)
    bucket = key.hash % num_buckets

    if include?(key)
      delete(key)
    else
      resize! if count >= @store.length
      @count += 1
    end

    @store[bucket].insert(key,val)
  end

  def get(key)
    @store[key.hash % num_buckets].get(key)
  end

  def delete(key)
    if @store[key.hash % num_buckets].remove(key)
      @count -= 1
    end
  end

  def each
  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(@store.length * 2) { LinkedList.new }
    @store.each do |linked_list|
      linked_list.each do |link|
        new_store[link.key.hash % new_store.length].insert(link.key, link.val)
      end
    end

    @store = new_store
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
  end
end
