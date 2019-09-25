require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

#Create cults
ogboni = Cult.new("Ogboni Fraternity", "Los Angeles", 1971, "Fuck Your Life Up!")
amok = Cult.new("Congress of Baboons", "Houston, Texas", 1899, "We are damn stupid!")
mbiam = Cult.new("The poor ain't making heaven", "Miami Florida", 1780, "What's the need for money?")

#Create Followers
dumbass = Follower.new("Damn Stupid", 45, "Ain't gone make it!")
dumbass2 = Follower.new("Damn Ignant", 78, "I don't know shit!")
gimp = Follower.new("I'm ugly", 33, "Can't have a girl")

#Create Bloodoaths
ogboni_oath = BloodOath.new("1999-08-17", ogboni, dumbass)
ogboni_oath3 = BloodOath.new("1989-11-01", mbiam, dumbass2)


# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
