require "binary_search_trees/version"
require "binary_search_trees/merge_sort.rb"

module PrettyPrint
	def pretty_print(node = @root, prefix = '', is_left = true)
		pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
		puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
		pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
	  
	end

end

module MergeSort
    def merge_sort(array)
        #basecase
        if array.length <= 1
            array
    
        else
            #devide string unttil indivisible
            if array.length.even? == true
                #two equal halves
                array_half_l = merge_sort(array[0..((array.length/2)-1)])
                array_half_r = merge_sort(array[(array.length/2)..-1])
                merge(array_half_l, array_half_r)
    
            else
                #two unequal halves. Left takes most elements
                #odd includes 1 so this is where sub division stops
                array_half_l =  merge_sort(array[0..((array.length/2 + 0.5)-1)])
                array_half_r =  merge_sort(array[(array.length/2 + 0.5)..-1])
                merge(array_half_l, array_half_r)
    
            end
    
        end
    
    end
    
    def merge(array_half_l, array_half_r)
        #checking which element is larger follows    
        array_out = []
        (array_half_l.length + array_half_r.length).times do
            if array_half_r[0].nil?
                array_out.append(array_half_l.shift)
    
            elsif array_half_l[0].nil?
                array_out.append(array_half_r.shift)
    
            elsif array_half_l[0] > array_half_r[0]
                array_out.append(array_half_r.shift)
    
            elsif  array_half_l[0] < array_half_r[0]
                array_out.append(array_half_l.shift)
    
            end
    
        end
    
        return array_out
    
    end
    
end

module BinarySearchTrees
	class Error < StandardError; end
	# Your code goes here...
	class Binary
		def self.to_decimal(binary)
		  raise ArgumentError if binary.match?(/[^01]/)
		  binary.reverse.chars.map.with_index do |digit, index|
			digit.to_i * 2**index
		  end.sum
		
		end

	end

	class Node
		include Comparable
		attr_reader :data
		attr_reader :left_child
		attr_reader :right_child
		def initialize(data = [],left_child,right_child)
			@data = data
			@left_child = left_child
			@right_child = right_child

		end
			
	end

	class Tree < Binary
		include MergeSort
		attr_reader :array
		def initialize(array)
			@array = array

		end
	
		def build_tree(array)
			mid = (@array.length)/2
			root = Tree.new(mid) #parent node for rercursive step
			#Adding children to tree
			root.left(build_tree(@array, 0, mid-1))
			root.right(build_tree(@array, mid+1, @array.length))

			return root

		end

		def insert(value_to_in)
			# reoder array and then make new search BST.
			# from existing binary tree traverse through until placed
			tree = #tree
			tree_levels #find number of rows BST
			inserted = false
			bi_number = []
			until inserted == true do
				for i in tree_levels do
					if value_to_in < node_level[i] #trace down left
						tree[i] << value_to_in
						bi_number.uppend(false)

					elsif value_to_in > node_level[i] #trace down rigth
						tree[i] << value_to_in
						bi_number.uppend(true)

					else #already a member of the tree
						inserted = true

					end

				end

				tree << bi_number
				inserted = true

			end

		end

		def delete(value_to_del)
			deleted = false
			bi_number = []
			until deleted == true do
				if has_2_children == true or has_1_child_r
					#delete
					#then join children to grand parents
					for i in tree_levels do
						if value_to_in < node_level[i] #trace down left
							tree[i] << value_to_in
							bi_number.uppend(false)
	
						elsif value_to_in > node_level[i] #trace down rigth
							tree[i] << value_to_in
							bi_number.uppend(true)
	
						end
						tree.delete(bi_number)
						tree.(bi_number + 1)#replace with right children
						deleted = true
	
					end
					
					
				else #no children
					#just delete
					#then join children to grand parents
					for i in tree_levels do
						if value_to_in < node_level[i] #trace down left
							tree[i] << value_to_in
							bi_number.uppend(false)
	
						elsif value_to_in > node_level[i] #trace down rigth
							tree[i] << value_to_in
							bi_number.uppend(true)
	
						end
						tree.delete(bi_number)
						tree.(bi_number + 0)#replace with left children
						deleted = true
	
					end
				
				end

			end

		end

		def find(value_to_find)
			found = false
			index_ = 0
			until found = true do
				for i in tree_levels do
					if value_to_in < node_level[i] #trace down left
						tree[i] << value_to_in
						bi_number.uppend(false)

					elsif value_to_in > node_level[i] #trace down rigth
						tree[i] << value_to_in
						bi_number.uppend(true)

					else
						found = true

					end

				end
				index_ += 1
				bi_number.index_ = index_
				#replace all trues with 1 and all false with 0

			end
			return bi_number #then return the binary number and index

		end

		def level_order(root)
			if root ==  nil; return end
			que = {root_1}
			while !que.empty?
				current = que[0]
				p current
				if current.left == nil
					que << current.left

				end

				if current.right == nil
					que << current.right

				end
				que.shift
				
			end

			return que

		end

		def inorder(root) #LRootR
			(root.right.length).times do
				# First recur on left child 
				inorder(root.left) 
				# then print the data of node 
				print(root.val)
				# now recur on right child 
				inorder(root.right) 

			end

			return root

		end

		def preorder(root)
			(root.left.length).times do
				# Recur on left child 
				preorder(root.left)

			end

			(tree.right.length).times do
				# Then recur on right child 
				preorder(root.right)

			end
			
			return root

		end

		def postorder(root)
			(root.left.length).times do
				# First recur on right child 
				postorder(root.right) 
				# then print the data of node 
				print(root.val)
				# now recur on left child 
				postorder(root.left) 

			end
			
			return root

		end

		def height(root)
			height_val = (find(root)).to_decimal/2
			#convert from binary to decimal then divide by 2 pos = dec pos/2
			return height_val

		end

		def depth(root)
			depth_val = find(root)
			return depth_val.index
			
		end

		def balanced?(root)
			if abs(root.left.length - root.right.length) > 1
				#unbalanced
				return false

			else #balanced
				return true

			end

		end

		def rebalance(root)
			if balanced?(root) #balanced already
				return root 

			else #balance
				#make new array with input as a member of the new array
				new_array = []
				for i in root do
					new_array = new_array.append(level_order(root))
					
				end
				

			end

			new_tree = Tree.new(new_array)
			return new_tree

		end

	end

end