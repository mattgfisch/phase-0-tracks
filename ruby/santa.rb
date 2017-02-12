# ----- SANTA CLASS DEFINITION
class Santa
  attr_reader :ethnicity
  attr_accessor :gender, :age

  def initialize(gender, ethnicity)
    
    puts "Initializing Santa instance..."

    @gender = gender
    @ethnicity = ethnicity
    @reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
    @age = 0

  end 
 
  def speak
    puts "Ho, ho, ho! Haaaappy holidays!"
  end

  def eat_milk_and_cookies(cookie_type)
    p "That was a good #{cookie_type} cookie!"
  end

  #Attribute changing methods
  def celebrate_birthday
    @age += 1
  end

  def get_mad_at(reindeer)
    @reindeer_ranking.delete(reindeer)
    @reindeer_ranking << reindeer
  end

end

# ----- TEST CODE

# happy = Santa.new("male", "white")

# happy.speak

# happy.eat_milk_and_cookies("snickerdoodle")

#Create array of santas
santas = []

#Establish test arguments
test_genders = ["agender", "female", "bigender", "male", "gender fluid", "N/A"]
test_ethnicities = ["black", "white", "chinese", "east-african", "aborigine", "N/A"]

#Loop through test arguments and shovel into a new santa in santas array
test_genders.length.times do |i|
  santas << Santa.new(test_genders[i], test_ethnicities[i])
end

# #Should print data for 6th santa
# p santas[5]

p santas[4].celebrate_birthday
p santas[4].get_mad_at("Dancer")
p santas[5].gender = "Male"
p santas[4].age
p santas[3].ethnicity

# ----- BUILDING SANTAS

# Get how many santas you want to build (n)
puts "How many santas would you like to build?"
n = gets.chomp.to_i

# Loop n times, creating new santas with random gender and ethnicity
n.times do
  # Randomly select gender and ethnicity
  santa = Santa.new(test_genders.sample, test_ethnicities.sample)

  # Randomly set age between 0 and 140
  rand_age = Random.new
  santa.age = rand_age.rand(141)

  #Print attributes of newly built santa
  puts "-"*10 + "NEW SANTA ATTRIBUTES" + "-"*10
  puts "Age: #{santa.age}"
  puts "Gender: #{santa.gender}"
  puts "Ethnicity: #{santa.ethnicity}"
  puts "-"*40
end




