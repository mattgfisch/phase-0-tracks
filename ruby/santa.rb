# ----- SANTA CLASS DEFINITION
class Santa
  
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

  def gender=(new_gender)
    @gender = new_gender
  end

  #Getter methods
  def age
    @age
  end

  def ethnicity
    @ethnicity
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


