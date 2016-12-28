# Question 1

10.times { |num| puts (" " * num) + "The Flintstones Rock!" }


# Question 2

statement = "The Flintstones Rock"

hash = {}

statement.delete(" ").each_char do |letter|
  hash[letter] = statement.count(letter)
end

p hash


# Question 3

- you can call to_s on (40 + 2) 

puts "the value of 40 + 2 is " + (40 + 2).to_s

#   Or use string interpolation

puts "the value of 40 + 2 is #{40 + 2}"


# Question 4

# 1st one outputs:
# 1
# 3

# 2nd one outputs:
# 1
# 2


# Question 5

def factors(number)
  dividend = number
  divisors = []
  while dividend > 0 do
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  divisors
end

# Bonus 1:
# Determines if the result is a number(integer) with no remainder

# Bonus 2:
# That is what is returned. Otherwise 'nil' is returned


# Question 6

# In the first method the argument gets modified (buffer).
# In the second method the initial input argument (input_array)
# does not get modified.


# Question 7

# limit is defined before and outside of the method

def fib(first_num, second_num, limit=15)
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"


# Question 8

words = "the flintstones rock"

def titleize(word)
word.split.map { |word| word.capitalize }.join(' ')
end

puts titleize(words)


# Question 9

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, details|
  case details["age"]
  when 0...18
    details["age_group"] = "kid"
  when 18...65
    details["age_group"] = "adult"
  else
    details["age_group"] = "senior"
  end
end


    
      









