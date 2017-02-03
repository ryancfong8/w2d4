class MyQueue
  attr_accessor :store
  def initialize
    @store = []
  end

  def enqueue(el)
    @store << el
  end

  def dequeue
    @store.shift
  end

  def peek
    @store.dup
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end
end

class MyStack
  attr_accessor :store
  def inititalize
    @store = []
  end

  def pop
    @store.pop
  end

  def push(el)
    @store << el
  end

  def peek
    @store.dup
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end
end
