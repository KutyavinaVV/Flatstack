class Sequence
  attr_accessor :val

  def initialize
    @val = "1"
  end

  def value
    @val
  end

  def next_number
    num = ""
    i = 0
    while (i < @val.length)
      count = 1
      j = i + 1
      while( j < @val.length)
        if(@val[j] == @val[i])
          count +=1
          i = j
          j +=1
        else
          break
        end
      end
      num = num + count.to_s + @val[i]
      i += 1
    end
    @val = num
    num
  end

  def get(n)
    puts(1)
    answ = "1"
    (1..n).each do |counter|
      num = next_number
      puts(num)
      answ += "\n"
      answ += num
    end
    answ
  end
end

s = Sequence.new
s.get(gets.chomp.to_i)
