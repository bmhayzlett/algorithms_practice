require 'byebug'
require_relative 'node.rb'

class Tree
  attr_reader :root

  def initialize(root = Node.new('a'))
    @root = root
  end

  def BFS_nodes
    nodes = [@root]
    names = []

    until nodes.empty?
      cur_node = nodes.shift
      names.push(cur_node.letter)
      cur_node.children.each do |child|
        nodes.push(child)
      end
    end

    return names
  end

  def DFS_nodes(node)
    return [node.name] if node.children.empty?
    nodes = []

    node.children.each do |child|
      nodes.concat(DFS_nodes(child))
    end

    nodes.push(node.name)
    return nodes
  end


  def seed_tree

    b = Node.new('b')
    c = Node.new('c')
    d = Node.new('d')
    e = Node.new('e')
    f = Node.new('f')
    g = Node.new('g')
    h = Node.new('h')
    i = Node.new('i')

    @root.add_child(b)
    @root.add_child(c)
    @root.add_child(d)
    b.add_child(e)
    e.add_child(f)
    e.add_child(g)
    d.add_child(h)
    h.add_child(i)

  end


end
