require_relative "stack_queue"

class StackQueue
  attr_accessor :store1, :store2
  def initialize
    @store1 = MyStack.new
    @store2 = MyStack.new
  end

  def enqueue(el)
    @store1.push(el)
  end

  def dequeue
    if @store2.empty?
      until @store1.empty?
        @store2.push(@store1.pop)
      end
      @store2.pop
    else
      @store2.pop
    end

  end

  def size
    @store1.size + @store2.size
  end

  def empty?
    @store1.empty? && @store2.empty?
  end
end

sq = StackQueue.new

p sq.store1
p sq.store2

# p sq.enqueue(1)
# p sq.enqueue(2)
# p sq.enqueue(3)
# p sq.dequeue
# p sq.dequeue
# p sq.enqueue(10)
# p sq.dequeue
