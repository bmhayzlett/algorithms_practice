berrequire 'byebug'

class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.length <= 1

    pivots = [array.pop]
    less = []
    greater = []

    array.each do |el|
      less << el if el < pivots.first
      pivots << el if el == pivots.first
      greater << el if el > pivots.first
    end

    return self.sort1(less) + pivots + self.sort1(greater)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
  end

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new { |x,y| x <=> y }


  end
end
