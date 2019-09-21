# require_relative '../config/environment.rb'

# def reload
#   load 'config/environment.rb'
# end
# # Insert code here to run before hitting the binding.pry
# # This is a convenient place to define variables and/or set up new object instances,
# # so they will be available to test and play around with in your console

# rob = Follower.new("Rob", 28, "Fun!")
# emir = Follower.new("Emir", 19, "No drinking!")


# cult1 = Cult.new("Flatiron", "Brooklyn, NY", 2014, "Happ coding")
# cult2 = Cult.new("Flatiron 2", "New York, NY", 2014, "Happ coding")
# cult3 = Cult.new("Flatiron3", "Brooklyn, NY", 2014, "Happ coding")

# rob.join_cult(cult1)
# cult2.recruit_follower(emir)
# emir.join_cult(cult3)

# binding.pry

# puts "Mwahahaha!" # just in case pry is buggy and exits


require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end


caf=Cult.new("Caferiler", "Kars", 1054, "We are not joking...")
nak=Cult.new("Naksiler", "Kars", 2001, "We are totally joking...")
rak=Cult.new("Raksiler", "Kars", 2003, "We are totally The King Among The Cults...")


fol1=Follower.new("Rob Meija", 27, "YOLO!")
fol2=Follower.new("Jacky Feng", 23, "COOL!")
fol3=Follower.new("Gaida Escobar", 21, "BAM!")
fol4=Follower.new("Pablo Escobar", 47, "DRUG!")
fol4=Follower.new("Superman", 173, "SAVE THE WORLD!")
fol5=Follower.new("Ethan", 31, "CODE!")


caf.recruit_follower(fol1)
caf.recruit_follower(fol2)
caf.recruit_follower(fol3)
caf.recruit_follower(fol4)
nak.recruit_follower(fol1)
nak.recruit_follower(fol3)
nak.recruit_follower(fol4)

fol5.join_cult(nak)
fol3.join_cult(rak)
binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits