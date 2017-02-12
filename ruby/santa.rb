# ----- SANTA CLASS DEFINITION
class Santa
  
  def initialize
    puts "Initializing Santa instance..."
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