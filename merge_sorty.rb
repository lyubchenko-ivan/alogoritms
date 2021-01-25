
def merge_sort(arr)
  if arr.length == 1
    return  arr
  else
    first_half = merge_sort(arr.slice!(0...arr.length/2))
    second_half = merge_sort(arr)
  end

  arr = []
   while (first_half.length > 0 || second_half.length > 0)
     if (first_half.empty?)
       arr << second_half.slice!(0)
     elsif (second_half.empty?)
       arr << first_half.slice!(0)
     elsif (first_half[0] <= second_half[0])
       arr << first_half.slice!(0)
     elsif (second_half[0] < first_half[0])
       arr << second_half.slice!(0)
     end
   end

  return arr
end

arr = []


10.times {arr << rand(100) + 1}

print arr
puts
print merge_sort(arr)