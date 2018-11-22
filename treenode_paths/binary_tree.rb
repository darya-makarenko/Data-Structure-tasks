# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end


class PathBuilder

  # @param {TreeNode} root
  # @return {String[]}
  def binary_tree_paths(root)
    path_build(root, nil, nil)
  end

  private

  #1) go further to left until we meet leaf (remembering the whole path)
  #2) then go to right and again to the left if possible as in step 1)
  #if not -- remember the whole path
  def path_build(root, path, all_paths)
    all_paths ||= Array.new
    path ||= ""

    if root
      path += root.val.to_s
      if (root.left || root.right)
        path += "->"
        path_build(root.left, path, all_paths)
        path_build(root.right, path, all_paths)
      else
        all_paths << path
      end
    end
    all_paths
  end

end

#test Tree
#  1
# / \
#2   3
#   / 
#  4
# / \ 
#5   6
root = TreeNode.new(1)
node1 = TreeNode.new(2)
node2 = TreeNode.new(3)
node3 = TreeNode.new(4)
node4 = TreeNode.new(5)
node5 = TreeNode.new(6)

root.left = node1
root.right = node2
node2.left = node3
node3.left = node4
node3.right = node5

path_builder = PathBuilder.new
puts path_builder.binary_tree_paths(root).join(" ")
