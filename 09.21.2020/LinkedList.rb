class LinkedList

  class Node
    attr_accessor :value, :next, :prev

    def initialize (value, nex, prev)
      @value = value
      @next = nex
      @prev = prev
    end

    def to_s
      @value.to_s
    end
  end

  include Enumerable

  attr_reader :size
  attr_accessor :head, :tail, :size

  def initialize (value)
    @size = 1
    @tail = @head= Node.new(value, nil,nil)
  end

  def <<(value)
    @size += 1
    @tail.next = Node.new(value,nil,@tail)
    @tail = @tail.next
  end

  def [](n)
    return nil if n >= @size
    count = 0
    node = @head
    while (count < n)
      node = node.next
      count += 1
    end
    return node
  end

  def []=(n, value)
    return false if (n >= @size)
    node = self[n]
    node.value = value
  end

  def each(&block)
    node = @head
    while node != nil
      yield node.value
      node = node.next
    end
  end

  def delete (value)
    node = @head
    if (node.value == value)
      @head = node.next
    else
      while (node.value != value)
        node = node.next
        if (node == nil)
          return false
        end
      end
      n = node.prev
      n.next = node.next
      @size -= 1
    end
  end

  def to_s
    self.each {|n| print (n.to_s + " ")}
  end
end

#Test
ll = LinkedList.new(11)
ll << 18
ll << 29
ll << 14
ll.delete(29)

puts (ll[0])
ll[3] = 17
puts (ll[2])
puts (ll[ll.size-1])

puts (ll.to_s)

#Enumerable
puts (ll.include?(10))
puts (ll.select(&:odd?))
puts (ll.any?{|n| n > 10})
