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

end

# ----- TEST CODE

happy = Santa.new

happy.speak

happy.eat_milk_and_cookies("snickerdoodle")