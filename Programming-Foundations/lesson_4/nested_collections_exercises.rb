# Exercise 1

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
arr1[2][1][3]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
arr2[1][:third][0]

arr3 = [['abc'], ['def'], {third: ['ghi']}]
arr3[2][:third][0][0]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
hsh1['b'][1]

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
hsh2[:third].key(0)


# Exercise 2

arr1 = [1, [2, 3], 4]
arr1[1][1] = 4

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
arr2[2] = 4

hsh1 = {first: [1, 2, [3]]}
hsh1[:first][2][0] = 4

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
hsh2[['a']][:a][2] = 4


# Exercise 3

a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a

a # => 2
b # => [3, 8]


# Exercise 4

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}
vowels = 'aeiou'

hsh.each do |_, values|
  values.each do |strings|
    strings.chars.each do |letters|
    puts letters if vowels.include?(letters)
    end
  end
end


# Exercise 5

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

arr.map do |sub_arr|
  sub_arr.sort do |a, b|
    b <=> a
  end
end


# Exercise 6

[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hsh|
  new_hsh = {}
  hsh.each do |key, value|
    new_hsh[key] = value + 1
  end
  new_hsh
end


# Exercise 7

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

arr.map do |sub_arr|
  sub_arr.select do |num|
   puts num if num % 3 == 0
  end
end


# Exercise 8

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
new_hsh = {}

arr.each do |elements|
  new_hsh[elements[0]] = elements[1]
end


# Exercise 9 

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

arr.map do |sub_arr|
  sub_arr.select do |odd_int|
    odd_int.odd?
  end
end


# Exercise 10


hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

hsh.map do |_, values|
  if values[:type] == 'fruit'
    values[:colors].map do |color|
      color.capitalize
    end
  elsif values[:type] == 'vegetable'
    values[:size].upcase
  end
end


# Exercise 11

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

arr.select do |hsh|
  hsh.all? do |_, value|
    value.all? do |num|
      num.even?
    end
  end
end


# Exercise 12

arr = [['stars', 'river'], 'letter', ['leaves', ['horses', 'table']]]

arr.each_with_object([]) do |element1, new_arr|
  if element1.size >= 5
    new_arr << element1
  else
    element1.each do |element2|
      if element2.size >= 5
        new_arr << element2
      else
        element2.each do |element3|
          new_arr << element3
        end
      end
    end
  end
end






      














