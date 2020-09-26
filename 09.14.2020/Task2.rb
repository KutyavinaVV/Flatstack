NUM = 5
def readData
  File.open ("data.txt") do |file|
    lines = file.readlines()
    size = lines.length
    table = Array.new(size){Array.new(NUM)}
    i = 0
    for line in lines
      data = line.split(',')
      for j in 0..4
        if (j == 2) and (i != 0)
          table[i][j] = data[j].delete(' ')
        else table[i][j] = data[j].strip
        end
      end
      i += 1
    end
    return table
  end
end

def writeData (data, name)
  fileName = 'data_sorted_by_' + name
  File.open(fileName, 'w') do |file|
    for i in 1..data.length-1
      for j in 0..4
        if (data[i][j] != nil)
          file.write(data[i][j] + ',' + " ")
        else
          file.puts(',' + " ")
        end
      end
      file.puts('')
    end
  end
end


def main
  data = readData()
  count = 1
  puts('Select a sorting criterion')
  data[0].each do |name|
    puts (count.to_s + " " + name)
    count +=1
  end
  index = gets.to_i - 1
  if (index > NUM)
    puts ('sorry')
    return false
  end
  name = data[0][index]
  i = n = 1
  j = 1
  while (i < data.length)
    n = i
    while (j <  data.length)
      if (data[n][index] > data[j][index])
        n = j
      end
      j +=1
    end
    for k in 0..NUM-1
      a = data[i][k]
      data[i][k] = data[n][k]
      data[n][k] = a
    end
    i += 1
    j = i+1
  end
  writeData(data, name)
end

main()
