# Exercise 1

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
hash = {}

flintstones.each_with_index do |name, index|
  hash[name] = index
end


# Exercise 2

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
ages.values.inject(:+)

#   or

total_age = 0
ages.each { |_, age| total_age += age }
puts total_age


# Exercise 3

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.delete_if { |_, age| age >= 100 }
p ages

#   or

ages.keep_if { |_, age| age < 100 }


# Exercises 4

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

ages.values.min


# Exercise 5

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.index { |name| name[0, 2] == "Be" }


# Exercise 6

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map { |name| name[0, 3] }


# Exercises 7

statement = "The Flintstones Rock"
result = {}

letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end


# Exercise 8

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

# => 1
# => 3

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

# => 1
# => 2


# Exercise 9

words = "the flintstones rock"

words.split.map { |word| word.capitalize}.join(' ')


# Exercise 10


munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, values|
  case values['age']
  when 0...18
    values['age_group'] = 'kid'
  when 18...65
    values['age_group'] = 'adult'
  else
    values['age_group'] = 'seniors'
  end
end


# Exercise 11

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" }
}

total_male_age = 0

munsters.each do |name, details|
  if details['gender'] == 'male'
    total_male_age += details['age']
  end
end



# Exercise 12

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each_pair do |name, details|
  puts "#{name} is a #{details['age']} year old #{details['gender']}"
end


# Exercise 13

def generate_uuid
  characters = []
  (0..9).each { |digit| characters << digit.to_s }
  ('a'..'f').each { |digit| characters << digit }
  
  uuid = ''
  sections = [8, 4, 4, 4, 12]

  sections.each_with_index do |section, index|
    section.times { uuid += characters.sample }
    uuid += '-' unless index >= sections.size - 1
  end
  uuid
end

puts generate_uuid

















