## RELEASE 0: PSEUDOCODE
=begin
 - Initialize array with integers
 - Define Method(target array, search integer)
  - Get length of target array
  - Initialize result array (Where occurrences get shoveled to)
  - For i, 0...target_array.length do
    - If target_array[i] == search_integer
      - result_array << i
    - End
  - result_array
=end


target_array = [1, 5, 68, 968, 9, 10, 87, 2, 5]

def search_array(array, integer)
  length = array.length
  result_array = []

  for i in 0...length do
    if array[i] == integer
      result_array << i
    end
  end

  if result_array.empty?
    nil
  else
    result_array
  end 
end

p search_array(target_array, 5)


# RELEASE 1: PSEUDOCODE
=begin
  - Define fib(term_number)
    - Initialize array = [0, 1, 0, 0]
    - Initialize running_total = 0
    - For i in 1...(term_number)
      - running_total = running_total + array[i - 1]
      - array << runing_total
    - array
  - Compare between fib(100) and real number
    - if fib(100)[-1] == 218922995834555169026
      - Print "Verified fibonacci sequence"
    - end
=end

def fib(term_number)
  array = [0, 1]
  running_total = 1

    if term_number == 1
      array.delete_at(1)
    elsif term_number == 0
      array.delete_at(0)
      array.delete_at(0)
    end

    for i in 1...(term_number-1)
      running_total = running_total + array[i - 1]
      array << running_total
    end
  array
  end

#p fib(6)

if fib(100)[-1] == 218922995834555169026
  print "Verified Fibonacci sequence"
end

# RELEASE 2: PSEUDOCODE
=begin
-Initialize an array = [1, 3, 6, 2, 0, 9]
- define the method bubble_sort(array) that will sort in ascending order
  -we need a variable containing the array length
  -call out a loop function that will carry out the swap function until not needed

  -for the entire loop compare element i to element i+1
    if i+1 > i, then swap
    -increment i+1
    -repeat/loop this until no more found
  -if no swap found, break the loop
-end
-print array
=end

def bubble_sort(array)
  n = array.length
  loop do
    swap = false

    (n-1).times do |i|
      if array[i] > array[i + 1]
        hold_value = array[i + 1]
        array[i + 1] = array[i]
        array[i] = hold_value

        swap = true
      end
    end
    break if !swap
  end

  array
end 





p bubble_sort(target_array)



# array.each{|i| 
#     if i == integer
#       result_array << i
#     end
#   }