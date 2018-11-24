$LOAD_PATH.unshift(".")
require "listnode_reverse"
require "rspec"

describe "Reversor"  do

  subject { Reversor.new }
  

  context "checking class structure" do

    it "should have method reverse_list" do
      expect(subject).to respond_to(:reverse_list)
    end

    it "should have method print_reversed" do
      expect(subject).to respond_to(:reversed_to_s)
    end

  end

  context "processes bad arguments" do
    empty_head = nil
    it "should return nil if head is nil" do
      expect(subject.reverse_list(empty_head)).to be_nil
    end
  end

  context "processes edge situations" do
    let(:listnode) { ListNode.new(1) }

    it "should stay the same if listnode has 1 node" do
      listnode.next = nil
      expect(subject.reverse_list(listnode).val).to eq(1) 
    end
  end

  context "performs base functions" do
    let(:head) { ListNode.new(1) }
    let(:node1) { ListNode.new(2) }
    let(:node2) { ListNode.new(3) }
    let(:node3) { ListNode.new(4) }
    let(:node4) { ListNode.new(5) }

    it "should set head value to the last node's value" do
      head.next = node1
      node1.next = node2
      node2.next = node3
      node3.next = node4
      node4.next = nil
      expect(subject.reverse_list(head).val).to eq(node4.val)
    end 

    it "should create new list with nodes in right order" do
      head.next = node1
      node1.next = node2
      node2.next = node3
      node3.next = node4
      node4.next = nil

      reversed_head = subject.reverse_list(head)
      expect(reversed_head.val).to eq(node4.val)
      expect(reversed_head.next.val).to eq(node3.val)
      expect(reversed_head.next.next.val).to eq(node2.val)
      expect(reversed_head.next.next.next.val).to eq(node1.val)
      expect(reversed_head.next.next.next.next.val).to eq(1)
    end

    it "should print list info" do
      head.next = node1
      node1.next = node2
      node2.next = node3
      node3.next = node4
      node4.next = nil

      expect(subject.reversed_to_s(head)).to eq ("5 4 3 2 1")
    end
  end

		
end


	



