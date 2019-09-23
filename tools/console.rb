require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

scientology = Cult.new("Scientology", "Washington, D.C.", 1952, "Going Clear")
mansons = Cult.new("The Manson Family", "San Francisco", 1967, "Total paranoia is total awareness")
heavens_gate = Cult.new("Heaven's Gate", "San Diego", 1974, "When in disgrace with fortune and men's eyes")
flat_earthers = Cult.new("Flat Earth Society", "Dover", 1956, "If you don't know something, and cannot understand it by first principles, then you shouldn't believe it.")
brethren = Cult.new("The Brethren", "Denver",1971, "So likewise, whosoever he be of you that forsaketh not all that he hath, he cannot be my disciple." )
pastafarianism = Cult.new("Pastafarianism", "Topeka", 2005,"The only dogma allowed in the Church of the Flying Spaghetti Monster is the rejection of dogma")
rcp = Cult.new("The Revolutionary Communist Party", "Chicago", 1975, "Revolution is not just NECCESARY, it is POSSIBLE.")

dan = Follower.new("Dan", 38, "I'll believe it when I see it!")
john = Follower.new("John", 25, "God will heal me.")
jane = Follower.new("Jane", 18, "He's so dreamy!")
charles = Follower.new("Charles", 32, "Revolution is now!")
diane = Follower.new("Diane", 45, "Creationism is not science")
steve = Follower.new("Steve", 22, "The aliens are coming for us")
luke = Follower.new("Luke", 55, "God wants us to abandon all material things")

BloodOath.new(scientology,john)
BloodOath.new(mansons, jane)
BloodOath.new(heavens_gate, steve)
BloodOath.new(flat_earthers, dan)
BloodOath.new(brethren, luke)
BloodOath.new(pastafarianism, diane)
BloodOath.new(rcp, charles)
BloodOath.new(mansons, steve)



binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
