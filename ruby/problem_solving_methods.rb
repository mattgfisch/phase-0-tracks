## RELEASE 1: PSEUDOCODE
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


# RELEASE 2: PSEUDOCODE
=begin
  - Define fib(term_number)
    - Initialize array = [0, 1, 0, 0]
    - Initialize running_total = 0
    - For i in 1..(term_number - 1)
      - running_total = running_total + array[i - 1]


p fib(6)

=end

# array.each{|i| 
#     if i == integer
#       result_array << i
#     end
#   }