require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end


caf=Cult.new("Caferiler", "Kars", 1054, "We are not joking...", 16)
nak=Cult.new("Naksiler", "Kars", 2001, "We are totally joking...", 18)
rak=Cult.new("Raksiler", "Kars", 2003, "We are totally The King Among The Cults...")


fol1=Follower.new("Rob Meija", 27, "YOLO!")
fol2=Follower.new("Jacky Feng", 23, "COOL!")
fol3=Follower.new("Gaida Escobar", 21, "BAM!")
fol4=Follower.new("Pablo Escobar", 47, "DRUG!")
fol4=Follower.new("Superman", 173, "SAVE THE WORLD!")
fol5=Follower.new("Ethan", 31, "CODE!")

#single source of truth

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