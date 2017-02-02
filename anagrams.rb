def first_anagram?(string1, string2)
  anagrams = permutations(string1.split(""))
  anagrams.each do |anagram|
    if string2 == anagram.join("")
      return true
    end
  end
  false
end

def permutations(array)
  return [array] if array.length <= 1


  # Similar to the subsets problem, we observe that to get the permutations
  # of [1, 2, 3] we can look at the permutations of [1, 2] which are
  # [1, 2] and [2, 1] and add the last element to every possible index getting
  # [3, 1, 2], [1, 3, 2], [1, 2, 3], [3, 2, 1], [2, 3, 1]

  # pop off the last element
  first = array.shift
  # make the recursive call
  perms = permutations(array)
  # we will need an array to store all our different permutations
  total_permutations = []


  # Now we iterate over the result of our recusive call say [[1, 2], [2, 1]]
  # and for each permutation add first into every index. This new subarray
  # gets added to total_permutations.
  perms.each do |perm|
    (0..perm.length).each do |i|
      total_permutations << perm[0 ... i] + [first] + perm[i .. -1]
    end
  end
  total_permutations
end

def second_anagram?(string1, string2)
  string1.each_char do |char|
    string2.each_char do |char2|
      if char == char2
        # puts char
        # puts char2
        string1.delete!(char)
        string2.delete!(char2)
        # puts string1
        # puts string2
      end
    end
  end
  # puts string1
  # puts string2
  string1.empty? && string2.empty?
end

def third_anagram?(string1, string2)
  string1.split("").sort == string2.split("").sort
end

def fourth_anagram?(string1, string2)
  hash = Hash.new(0)
  string1.each_char do |char|
    hash[char] += 1
  end

  string2.each_char do |char|
    hash[char] -= 1
  end

  return true if hash.values.all? {|val| val == 0}
  false

end

p first_anagram?("gizmo", "sally")    #=> false
p first_anagram?("elvis", "lives")

p second_anagram?("gizmo", "sally")    #=> false
p second_anagram?("elvis", "lives")

p third_anagram?("gizmo", "sally")    #=> false
p third_anagram?("elvis", "lives")

p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")
