def bad_two_sum?(array, target)
  array.each_with_index do |el, i|
    array.each_with_index do |el2, j|
      next if i == j
      return true if target == el + el2
    end
  end
  false
end

def okay_two_sum?(array, target)
  sorted_array = array.sort
  high_num = target
  until high_num.nil?
    high_num = sorted_array.reverse.bsearch {|x| x < high_num}
    break if high_num.nil?
    return true if sorted_array.reverse.bsearch {|x| x == (target - high_num) }
  end
  false
end


array = [0,1,5,7]
p bad_two_sum?(array, 6)
p bad_two_sum?(array, 10)

p okay_two_sum?(array, 6)
p okay_two_sum?(array, 10)

arr = [0, 1, 5, 7, 8, 10, 11]

p okay_two_sum?(arr, 15)
p okay_two_sum?(arr, 22)
