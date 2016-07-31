require 'byebug'

class BinaryMinHeap
  def initialize(&prc)
    @store = []
    @prc = prc ||= Proc.new { |x, y| x <=> y }
  end

  def count
    @store.length
  end

  def extract

    extracted = @store[0]

    if @store.length == 1
      @store = []
      return extracted
    else
      @store[0] = store.pop
      BinaryMinHeap.heapify_down(@store, 0, @store.length, &prc)
      return extracted
    end

  end

  def peek
    @store[0]
  end

  def push(val)
    loc = @store.length
    @store.push(val)
    BinaryMinHeap.heapify_up(@store, loc, @store.length, &prc)
  end

  protected
  attr_accessor :prc, :store

  public
  def self.child_indices(len, parent_index)
    children = []

    child1 = (parent_index * 2) + 1
    child2 = child1 + 1

    children.push(child1) if child1 < len
    children.push(child2) if child2 < len

    children
  end

  def self.parent_index(child_index)
    if child_index == 0
      raise 'root has no parent'
    elsif child_index % 2 == 0
      return (child_index / 2) - 1
    else
      return child_index / 2
    end
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc ||= Proc.new { |x, y| x <=> y }
    children = self.child_indices(len, parent_idx)

    parent_el = array[parent_idx]
    return array if children.length < 1
    # byebug

    child1_el = array[children[0]]
    child2_el = array[children[1]] if children.length > 1

    if prc.call(parent_el, child1_el) > 0 && (children.length == 1 || prc.call(child2_el, child1_el) > 0)
      array[parent_idx] = child1_el
      array[children[0]] = parent_el
      return self.heapify_down(array, children[0], len, &prc)
    elsif children.length > 1 && prc.call(parent_el, child2_el) > 0
      array[parent_idx] = child2_el
      array[children[1]] = parent_el
      return self.heapify_down(array, children[1], len, &prc)
    else
      return array
    end

  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    prc ||= Proc.new { |x, y| x <=> y }

    return array if child_idx == 0
    parent_idx = self.parent_index(child_idx)

    child_el = array[child_idx]
    parent_el = array[parent_idx]

    if prc.call(child_el, parent_el) < 0
      array[child_idx] = parent_el
      array[parent_idx] = child_el
      return self.heapify_up(array, parent_idx, len, &prc)
    else
      return array
    end
  end

end
