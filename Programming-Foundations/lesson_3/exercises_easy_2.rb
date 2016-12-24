# Question 1

ages.key?("Spot")

Bonus

ages.include?("Spot")
ages.member?("Spot")

# Can look for value as well

ages.has_value?("Spot")


# Question 2

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

ages.values.inject(:+)


# Question 3

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.delete_if { |_, v| v >= 100 }

#    or

ages.keep_if { |_, v| v < 100 }


# Question 4

munsters_description = "The Munsters are creepy in a good way."

munsters_description.capitalize!
munsters_description.swapcase!
munsters_description.downcase!
munsters_description.upcase!


# Question 5

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }

ages.merge!(additional_ages)


# Question 6

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

ages.values.min


# Question 7

advice = "Few things in life are as important as house training your pet dinosaur."

advice.match("Dino")

#   Or

advice.include?("Dino")


# Question 8

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.index { |name| name[0, 2] == "Be" }


# Question 9

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! { |name| name[0, 3] }

#   Or

flintstones.map! do |name|
  name[0, 3]
end


# Question 10

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! { |name| name[0, 3] }











