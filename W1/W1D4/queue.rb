class Queue

  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue << el
  end

  def dequeue
    @queue.shift
  end

  def show
    p @queue
  end

end

q = Queue.new
q.enqueue("Happy")
q.enqueue("Days")
q.enqueue("Are")
q.enqueue("Here")
q.show
q.dequeue
q.show
