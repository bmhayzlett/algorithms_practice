class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end
end

class LinkedList
  self.extend(Enumerable)

  def initialize
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    return @head.val
    nil
  end

  def last
    return @tail.val
    nil
  end

  def empty?
  end

  def get(key)
    current_link = @head

    while current_link != nil
      return current_link.val if current_link.key == key
      current_link = current_link.next
    end

    nil
  end

  def include?(key)
    return false if @head == nil
    current_link = @head

    while current_link != nil
      return true if current_link.key == key
      current_link = current_link.next
    end

    false
  end

  def insert(key, val)
    new_link = Link.new(key,val)

    if @head == nil
      @head = new_link
      @tail = @head
    else
      current = @head

      while current.next != nil
        current = current.next
      end

      current.next = new_link
      @tail = new_link
      @tail.prev = current
    end

  end

  def remove(key)
    current_link = @head
    removed = false

    while current_link != nil
      if @head == @tail && current_link == @head && current_link.key == key
        @head = nil
        @tail = nil
        removed = true
        break
      elsif current_link == @head && current_link.key == key
        @head = current_link.next
        current_link = current_link.next
        current_link.prev = nil
        removed = true
      elsif current_link == @tail && current_link.key == key
        @tail = current_link.prev
        current_link.prev.next = nil
        current_link.prev = nil
        removed = true
      elsif current_link.key == key
        current_link.prev.next = current_link.next
        current_link.next.prev = current_link.prev
        current_link.next = nil
        current_link.prev = nil
        removed = true
      end

      current_link = current_link.next
    end

    removed
  end

  def each
    current_link = @head

    while current_link != nil
      yield current_link
      current_link = current_link.next
    end

  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
