require_relative "heap"

class Array
  def heap_sort!
    iterator = 1

    while iterator < self.length
      BinaryMinHeap.heapify_up(self, iterator, self.length)
      iterator += 1
    end

    iterator = self.length - 1

    while iterator > 0
      self[0], self[iterator] = self[iterator], self[0]
      BinaryMinHeap.heapify_down(self,0,iterator)
      iterator -= 1
    end

    self.reverse!
  end
end
