class Stack

  def initialize
    @stack = []
  end

  def add(el)
    @stack << el
  end

  def remove
    @stack.pop
  end

  def show
    p @stack
  end

end

a = Stack.new
a.add(3)
a.add(2)
a.add(4)
a.remove
a.show
