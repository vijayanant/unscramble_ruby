module VJTree

# @author Vijay Anant
  class VJNode 

    include Enumerable
    include Comparable


    attr_reader :key
    attr_accessor :name
    attr_accessor :value
    attr_reader :parent

    def initialize(key, name, value=nil)
      @key, @name, @value = key, name, value
      self.make_me_root!
      @children_hash = Hash.new
    end

    def root
        x = self
        x = x.parent until x.is_root?
        x
      end
  
    def is_root?
      @parent.nil?
    end
  
    def has_value?
      @value != nil
    end
  
    def is_leaf?
      !has_children?
    end
  
    def has_children?
      @children_hash.size != 0
    end
  
    def node_copy
      VJTree::VJNode.new(@key, @name, @value ? @value.clone : nil)
    end
  
  
    def to_s
      "Key: #{@key}," +
      " Name: #{@name}," +
      " Value: " + (@value ? @value.to_s : "<Empty>") +
      #" Parent: " + (is_root?()  ? "<None>" : @parent.key.to_s) +
      #" Children: #{@children.length}" +
      #" Total Nodes: #{size()}" + 
      "."
    end
  
    def <<(child)
      add(child)
    end
  
    def add(child, at_index = -1)
      raise ArgumentError, "Attempting to add a nil node" unless child 
      child.parent.remove! child if child.parent # Detach from the old parent
      @children_hash[child.name]  = child
      child.parent = self
      child
    end
  
    def remove!(child)
      return nil unless child
      @children_hash.delete(child.name)
      child.make_me_root!
      child
    end
  
    def [](name)
        raise ArgumentError, "Name needs to be provided!" if name == nil
        @children_hash[name]
    end
  
  
    def each(&block)             # :yields: node
      return self.to_enum unless block_given?
      node_stack = [self]   # Start with this node
      until node_stack.empty?
        current = node_stack.shift    # Pop the top-most node
        if current                    # The node might be 'nil' (esp. for binary trees)
          yield current               # and process it
          # Stack children of the current node at top of the stack
          node_stack = current.children.clone.concat(node_stack)
        end
      end
      return self if block_given?
    end


    def children
      if block_given?
        @children_hash.each {|child| yield child}
        return self
      else
        return @children_hash.clone.values
      end
    end

    def parent=(parent)
      @parent = parent
    end
   
    protected :parent=
  
    def make_me_root!
      self.parent = nil
    end

    protected :make_me_root!

  end
end
