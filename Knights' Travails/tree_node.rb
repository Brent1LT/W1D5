require 'byebug'
class PolyTreeNode
  attr_accessor :value, :children, :parent

  def initialize(value)
    @parent = nil
    @children = []
    @value = value
  end 
  
  def parent=(parent)
    self.parent.children.delete(self) if self.parent != nil
    @parent = parent
    parent.children << self if parent != nil
  end 

  def add_child(child_node)
    child_node.parent=(self)
    children << child_node if !children.include?(child_node)
  end

  def remove_child(child_node)
    child_node.parent=(nil)
    raise ArguementError, "Child node does not exist" if !self.children.include?(child_node)
    children.delete(child_node)
  end

  def dfs(target)
    return self if self.value == target
    self.children.each do |child|
        curr_node = child.dfs(target)
        return curr_node if curr_node != nil
    end 
    nil 
  end 

  def bfs(target)
    q = []
    q << self 
    until q.empty?
        curr_node = q.shift
        return curr_node if curr_node.value == target
        curr_node.children.each {|child| q << child}
    end
  end
  
  def inspect
    "Value: #{self.value}\tChildren: #{self.children} "
  end

end

# n1 = PolyTreeNode.new("root1")
# n2 = PolyTreeNode.new("root2")
# n3 = PolyTreeNode.new("root3")

# # connect n3 to n1
# n3.parent = n1
# # connect n3 to n2
# n3.parent = n2

# # this should work
# raise "Bad parent=!" unless n3.parent == n2
# raise "Bad parent=!" unless n2.children == [n3]

# # this probably doesn't
# raise "Bad parent=!" unless n1.children == []