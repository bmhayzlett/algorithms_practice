class Node
  attr_reader :children, :name

  def initialize(name)
    @name = name
    @children = []
  end

  def add_child(node)
    @children.push(node)
  end

end

# BFS outputs ['a', 'b', 'c', 'd', 'e', 'h', 'f', 'g', 'i']
