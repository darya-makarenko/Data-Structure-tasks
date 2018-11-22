#Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end


class Reversor

  # @param {ListNode} head
  # @return {ListNode}
  def reverse_list(head)
  	current_node = head
  	prev_node = nil
    #this permutation can be illustrated as 1->2->3 <=> 2->3->1 <=> 3->2->1
    while current_node 
   		prev_node, current_node.next, current_node = current_node, prev_node, current_node.next
   	end
   	prev_node
  end

end

#test ListNode structure
head = ListNode.new(1)
node1 = ListNode.new(2)
node2 = ListNode.new(3)
node3 = ListNode.new(4)
node4 = ListNode.new(5)

head.next = node1
node1.next = node2
node2.next = node3
node3.next = node4
node4.next = nil

reversor = Reversor.new
reversed_head = reversor.reverse_list(head)

values = Array.new
node = reversed_head
while node
	values << node.val
	node = node.next
end

puts "The reversed listnode: #{values.join(" ")}"