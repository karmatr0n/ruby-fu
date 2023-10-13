# Mutex is the short hand for multual exclusion. if you wrap some seccion of code with a mutex you
# guarantee that only one thread can execute that code at a time. This is useful when you have a
# shared resource that you want to protect from concurrent access.
shared_array = Array.new
mutex = Mutex.new
10.times.map do
    Thread.new do
        1000.times do
            mutex.lock
            shared_array << nil
            mutex.unlock
        end
    end
end.each(&:join)
puts(shared_array.size)


# This class represents an ecommerce order
class Order
  attr_accessor :amount, :status

  def initialize(amount, status)
    @amount, @status = amount, status
    @mutex = Mutex.new
  end

  def pending?
    status == 'pending'
  end

  # Ensure that only one thread can collect payment at a time
  def collect_payment
    @mutex.synchronize do
      puts "Collecting payment..."
      self.status = 'paid'
    end
  end
end

order = Order.new(100.00, 'pending')
# Ask 5 threads to check the status, and collect
# payment if it's 'pending'
5.times.map do
  Thread.new do

    if order.pending?
      order.collect_payment
      puts "Thread #{Thread.current.object_id} sees #{order.status}"
    end
  end
end.each(&:join)
