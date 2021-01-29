def merge_sort(arr)
  if arr.length == 1
    return arr
  else
    first = merge_sort(arr.slice!(0...arr.length/2))
    second = merge_sort(arr.slice!(0..-1))
  end

  while (!first.empty? || !second.empty?)
    if(first.empty?)
      arr << second.slice!(0)
    elsif (second.empty?)
      arr << first.slice!(0)
    elsif (first[0] <= second[0])
      arr << first.slice!(0)
    elsif (second[0] < first[0])
      arr << second.slice!(0)
    end
  end

  return arr
end

arr = []


10.times {arr << rand(100) + 1}

print arr
puts
print merge_sort(arr)