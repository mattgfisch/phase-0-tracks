# Virus Predictor

# I worked on this challenge [by myself, with: ].
# We spent [#] hours on this challenge.

# EXPLANATION OF require_relative
#require_relative links data we've written and needs a path
#
require_relative 'state_data'

class VirusPredictor
  attr_reader :state, :population, :population_density

  #Initializes instance of VirusPredictor, populates variables
  #with given inputs
  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end

  #Runs the other two methods used to predict death and speed of death.
  def virus_effects
    predicted_deaths
    speed_of_spread
  end

  private
  #Calculates number of deaths based on density and population
  def predicted_deaths
    # predicted deaths is solely based on population density
    if population_density >= 200
      multiplier = 0.4
    elsif population_density >= 150
      multiplier = 0.3
    elsif population_density >= 100
      multiplier = 0.2
    elsif population_density >= 50
      multiplier = 0.1
    else
      multiplier = 0.05
    end

    number_of_deaths = population * multiplier).floor

    print "#{state} will lose #{number_of_deaths} people in this outbreak"

  end

  #Calculates speed of death in months
  def speed_of_spread #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.

    if population_density >= 200
      speed = 0.5
    elsif population_density >= 150
      speed = 1
    elsif population_density >= 100
      speed = 1.5
    elsif population_density >= 50
      speed = 2
    else
      speed = 2.5
    end

    puts " and will spread across the state in #{speed} months.\n\n"

  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state


STATE_DATA.each do |key,value|
  state = VirusPredictor.new(key, value[:population_density], value[:population]) 
  state.virus_effects
end

# alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
# alabama.virus_effects

# jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
# jersey.virus_effects

# california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
# california.virus_effects

# alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
# alaska.virus_effects


#=======================================================================
# Reflection Section
=begin

- Both hashes use key, value pairs, but in the outer hash the key is a string and the assignment is done
via a hash rocket, while in the inner hash the assignment is done using syntactic sugar of a symbol

- require is used when the imported file is a file that will only be accessed for its data, while require_relative is used to 
provide features to be used in the program by including it in the program, library, framework etc.

- You can use .each_key |key|, .each_value|value|, and .each |key, value| to iterate through a hash

- The variables weren't required because all of them were instance variables. They don't need to be passed through
as arguments because they can be accessed within each respective method within virus_effects.

- This challenge helped me think about refactoring a class, and how you can reduce clutter by using attr_reader for
the instance variables you access within methods in the class.



=end