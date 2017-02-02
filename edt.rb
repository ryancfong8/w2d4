def my_min(list)
  result = nil
  list.each_with_index do |el, i|
    smallest_num = true
    list.each_with_index do |el_two, j|
      next if i == j
      smallest_num = false if el > el_two
    end
    result = el if smallest_num == true
  end
  result
end

def better_my_min(list)
  min = list.first
  list.drop(1).each do |el|
    min = el if el < min
  end

  min
end

def subarrays(array)
  result = []
  (0..array.length-1).each do |i|
    (i...array.length).each do |j|
      result << array[i..j]
    end
  end

  result
end

def largest_contiguous_subsum(list)
  sub_arrays = subarrays(list)
  sum_array = sub_arrays.map do |sub|
    sub.inject(:+)
  end
  sum_array.max
end

def better_lcs(list)
  max_sum = 0
  current_sum = 0
  list.each do |el|
    current_sum = el + current_sum
    if current_sum  > max_sum
      max_sum = current_sum
    elsif current_sum < 0
      current_sum = 0
    end
  end
  max_sum
end


list = [ 0, 3, 5, 4, -5, 10, 1, -7 ]
p my_min([ 0, 3, 5, 4, -5, 10, 1, -7 ])

p better_my_min(list)

p subarrays([5,3,-7])

p largest_contiguous_subsum([5,3,-7])
p better_lcs([5,3,-7])
list2 = [2, 3, -6, 7, -6, 7]
p better_lcs(list2)
