# Question 1

1
2
2
3

uniq returns a new array
numbers was not mutated


# Question 2

1. != is not equal to
2. ! before something returns the opposite
3. ! after something modifies it 
4. ? before something is ternary for if..else
5. ? after something returns a boolean
6. !! before something turns the object into their boolean equivalent.


# Question 3

word = 'urgent'
advice = "Few things in life are as #{word} as house training your pet dinosaur."

#  or

advice.gsub!('important', 'urgent')


# Question 4

numbers.delete_at(1) deletes the number at index 1 = [1, 3, 4, 5]
numbers.delete(1) deletes the element 1 = [2, 3, 4, 5]


# Question 5

(10..100)cover?(42)

#   also possibly...but more complex

(10..100)include?(42)



# Question 6

famous_words.insert(0, 'Four score and ')
famous_words.prepend('Four score and ')
"Four score and " << famous_words
"Four score and " + famous_words


# Question 7

42


# Question 8

flinstones.flatten!


# Question 9

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

flintstones.assoc("Barney")


# Question 10

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones_hash = {}
flintstones_hash.each_with_index do |name, index|
  flintstones_hash[name] = index
end




