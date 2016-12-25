# Question 1

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)


# Question 2

flintstones << "Dino"


# Question 3

flintstones.push("Dino", "Hoppy")

#   Or

flintstones.push("Dino").push("Hoppy")

#   Or

flintstones.concat(%w(Dino Hoppy))


# Question 4

advice = "Few things in life are as important as house training your pet dinosaur."

advice.slice!(0, advice.index('house'))

slice does not mutate so it returns the originl string


# Question 5

statement = "The Flintstones Rock!"

statement.count("t")

#   Or

statement.scan('t').count


# Question 6

title = "Flintstone Family Members"

title.center(40)
