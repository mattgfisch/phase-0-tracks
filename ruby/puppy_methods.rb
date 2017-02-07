class Puppy

  def initialize
    puts "Initializing new puppy instance..."
  end

  def fetch(toy)
    puts "I brought back the #{toy}!"
    toy
  end

  def speak(num)
    p ("Woof! " * num)
  end  

  def roll_over
    puts "*rolls over*"
  end

  def dog_years(h_years)
    d_years = h_years * 7
    d_years
  end

  def sit
    puts ":P"
  end
end

class Gymnast

  def initialize
    puts "Hello! I am a new gymnast!"
  end

  def backflip
    puts "I did a backflip!"
  end

  def cartwheels
  feat = "I did a cartwheel"
  feat
  end  

end


#---------DRIVER CODE

Fido = Puppy.new #Creates new instance of class, called Fido

Fido.fetch("ball") #Accesses "fetch" method within Puppy class

Fido.speak(5) # Prints "Woof!" num times

Fido.roll_over # Prints *rolls over*

p Fido.dog_years(6) # Prints age in dog years

Fido.sit # Prints tongue emoji

Fred = Gymnast.new
feats = []
feats << Fred.cartwheels
 
gymnast = []

gymnast = 50.times.collect { |olympian|     
  olympian = Gymnast.new
}

p gymnast

gymnast[22].backflip

# Iterating to call an instance of class to run a method
gymnast.each { |person| 
 puts "#{person}:"
 person.backflip
}
