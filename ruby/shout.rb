# ----- OLD CODE

# module Shout
#   def self.yell_angrily(words)
#     words + "!!!" + " :("
#   end

#   def self.yelling_happily(words)
#     words + "!" + " :) :) :)"
#   end
# end

# p Shout.yell_angrily("Why I oughtta")

# p Shout.yelling_happily("Hooray")

# ----- NEW CODE

module Shout
  def scare_predator
    puts "*Hisssssss*"
  end

  def stalk_prey
    puts "*Grrrrrrrrrr*"
  end
end

class Mountain_Lion
  include Shout
end

class Tiger
  include Shout
end
  
mountain_lion = Mountain_Lion.new
mountain_lion.stalk_prey
mountain_lion.scare_predator

tiger = Tiger.new
tiger.scare_predator
tiger.stalk_prey