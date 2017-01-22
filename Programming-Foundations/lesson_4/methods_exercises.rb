# Exercise 1

[1, 2, 3].select do |num|
  num > 5
  'hi'
end

# => [1, 2, 3]
# select works off of truthiness of the return value of block.
# since 'hi' will always have a truthy return value 
#   all of the elements are contained in the new array


# Exercise 2

['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

# => 2
# counts the number of element in the block that return true
# we can look at ruby docs under Array#count for information on this


# Exercise 3

[1, 2, 3].reject do |num|
  puts num
end

# => [1, 2, 3]
# returns only values that are not true
# since nil(returned by puts) is falsey all elements are returned in new array

# Exercise 4

['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

# => { "a" => "ant", "b" => "bear", "c" => "cat" }


# Exercise 5

hash = { a: 'ant', b: 'bear' }
hash.shift

# => [:a, "ant"]
# removes a key value pair and returns it as a two item array


# Exercise 6

['ant', 'bear', 'caterpillar'].pop.size

# => 11
# pop removes last element of array
# size is being called on last item..(caterpillar)


# Exercise 7

[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

# => true
# return value of block is determined by last expression in block
# num.odd? returns a boolean
# return value of block will be boolean


# Exercise 8

arr = [1, 2, 3, 4, 5]
arr.take(2)

# => [1, 2]
# take returns the first elements from the array
# take is not destructive
# can tell by checking in irb


# Exercise 9

{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

# => [nil, "bear"]
# ant evaluates to false, returns nil
# bear evaluates to true, returns bear


# Exercise 10

[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

# => [1, nil, nil]
# num is last statement evaluated in block
# num is true so 1 is passed into new array
# puts num returns nil so nil is returned for the 2 elements
#    meeting the condition of the if statement


# Exercise 11

arr = ['10', '11', '9', '7', '8']

arr.sort do |a, b|
  b.to_i <=> a.to_i
end


# Exercise 12

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysees', author: 'James Joyce', published: '1922'}
]

books.sort_by do |book|
  book[:published]
end



















