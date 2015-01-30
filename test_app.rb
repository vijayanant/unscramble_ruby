require './tree'

 def setup
    @root = VJTree::VJNode.new("ROOT", "Root Node")
    @child1 = VJTree::VJNode.new("Child1", "Child Node 1")
    @child2 = VJTree::VJNode.new("Child2", "Child Node 2")
    @child3 = VJTree::VJNode.new("Child3", "Child Node 3")
    @child4 = VJTree::VJNode.new("Child4", "Grand Child 1")
    @child5 = VJTree::VJNode.new("Child5", "Child Node 4")
 end

  def setup_test_tree
    @root << @child1
    @root << @child2
    @root << @child3 << @child4
  end

  setup()
  setup_test_tree()
  @root.each { |child| puts "#{child} "}

  puts @child4.root
  puts @root["Child Node 1"]
