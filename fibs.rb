def fibs(num)
  last = 0
  present = 1

  arr = [last, present]
  (num-2).times do
    temp = present
    present += last
    last = temp
    arr << present
  end
  return  arr
end

def fibs_sec(num)
  if num == 0 then return  0
  elsif num == 1 then return 1
  else return fibs_sec(num - 2) + fibs_sec(num - 1); end
end


puts (fibs_sec(12))