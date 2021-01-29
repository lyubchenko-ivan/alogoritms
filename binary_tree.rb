#узел дерева
class Node
  attr_accessor :value, :parent_node, :left_child_node, :right_child_node

  def initialize(value)
    @value = value
    self.left_child_node = nil
    self.right_child_node = nil
  end
end

#развертывание бинарного дерева поиска
def build_tree(arr)
  head = Node.new(arr.slice!(0))


  while (!arr.empty?)
    node = head
    parent = node

    loop do
      if  arr[0] < node.value
        if node.left_child_node.nil?
          node = Node.new(arr.slice!(0))
          parent.left_child_node = node
          node.parent_node = parent
          break
        else
          node = node.left_child_node
          parent = node
        end

      elsif arr[0] >= node.value
        if node.right_child_node.nil?
          node = Node.new(arr.slice!(0))
          parent.right_child_node = node
          node.parent_node = parent
          break
        else
          node = node.right_child_node
          parent = node
        end

      end

    end



  end

  return head

end

#поиск в ширину
def breadth_first_search(tree, value)
  visited = []
  to_explore = []
  visited << tree
  to_explore << tree

  begin
    node = to_explore.slice!(0)
    return node if node.value == value

    if (!node.left_child_node.nil? && !visited.include?(node.left_child_node))
      to_explore << node.left_child_node
      visited << node.left_child_node
    end

    if (!node.right_child_node.nil? && !visited.include?(node.right_child_node))
      to_explore << node.right_child_node
      visited << node.right_child_node
    end

  end while(!to_explore.empty?)

  return  nil
end

#поиск в глубину
def depth_first_search(tree, value)
  to_explore = []
  visited = []
  to_explore << tree
  visited << tree

  while (!to_explore.empty?)
    node = to_explore.slice!(-1)
    puts node.value
    return  node if node.value == value

    if (!node.right_child_node.nil? && !visited.include?(node.right_child_node))
      to_explore << node.right_child_node
      visited << node.right_child_node
    end

    if (!node.left_child_node.nil? && !visited.include?(node.left_child_node))
      to_explore << node.left_child_node
      visited << node.left_child_node
    end

  end

  return  nil

end


#поиск в глубину с помощью рекурсии
def dfs_sec(node, value)
  return  node if (node.nil?) || (node.value == value)


  left =  dfs_sec(node.left_child_node, value)

  return left if !left.nil?

  return  dfs_sec(node.right_child_node, value)
end

arr = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]

tree = build_tree(arr)

puts dfs_sec(tree, 6345)