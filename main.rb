require "binary_search_trees.rb"


array = Array.new(15) { rand(1..100) }
tree = Tree.new(array)
puts tree.balanced?
puts preorder(tree)
puts postorder(tree)
puts inorder(tree)
puts tree.insert(100)
puts tree.balanced?
puts tree.rebalance(tree)
puts tree.balanced?
puts preorder(tree)
puts postorder(tree)
puts inorder(tree)

=begin
Constructed balanced BST example 
      4 
    /  \ 
   2    6 
  / \  / \ 
1   3 5   7 
            \
              9
              \
			   10
1. Create a binary search tree from an array of random numbers (`Array.new(15) { rand(1..100) }`)
2. Confirm that the tree is balanced by calling `#balanced?`
3. Print out all elements in level, pre, post, and in order
4. try to unbalance the tree by adding several numbers > 100
5. Confirm that the tree is unbalanced by calling `#balanced?`
6. Balance the tree by calling `#rebalance`
7. Confirm that the tree is balanced by calling `#balanced?`
8. Print out all elements in level, pre, post, and in order

=end