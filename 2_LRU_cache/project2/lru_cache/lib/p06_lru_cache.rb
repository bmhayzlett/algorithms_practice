require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if @map[key]
      called = @map[key].val
      @map[key] = update_link!(@map[key])
    else
      eject! if @map.count >= @max
      called = @prc.call(key)
      link = @store.insert(key,called)
      @map[key] = link
    end

    return called
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
  end

  def update_link!(link)
    # suggested helper method; move a link to the end of the list
    @store.remove(link.key)
    @store.insert(link.key,link.val)
  end

  def eject!
    @map.delete(@store.head.key)
    @store.remove(@store.head.key)
  end
end
