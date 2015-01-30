require 'tree'

class Unscrambler 

  def initialize
    @l = []
  end


  def add s
    @l << s
  end

  def get s
    @l
  end
end
