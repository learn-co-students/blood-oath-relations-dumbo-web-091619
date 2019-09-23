require_relative '../config/environment.rb'
require 'date'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console


green_street_hooligans = Cult.new("The Hooligans of Green Street", "Green Street, duh", 1997, "We're just here to feel alive")
crystal_people = Cult.new("The Crystal People", "LA, baby", 1997, "We're, like, extra special")
big_tent = Cult.new("The People of the Big Tent", "Taos", 2001, "Wanna come sit in the tent?")

jenna = Follower.new("Jenna (Rainbow) McKibbens", 27, "Be free!")
indigo = Follower.new("Indigo McTavish", 34, "Take it easy, baby!")
harold = Follower.new("Harold Gunderson", 32, "No.")
ethan = Follower.new("Ethan F. Anderson", 28, "We just all gotta, like, find what works, you know man?")
eleanor = Follower.new("Eleanor Smith-Jones", 33, "I see vibrations")
tom = Follower.new("Tom Delonge", 44, "Aliens, man, aliens.")
keith = Follower.new("Keith McKenzie", 37, "I will be ready when they arrive!")

jenna_crystal_people = BloodOath.new("10-23-2106", crystal_people, jenna)
tom_big_tent = big_tent.recruit_follower(tom)
tom_green_street_hooligans = tom.join_cult(green_street_hooligans)
ethan_crystal_people = crystal_people.recruit_follower(ethan)
indigo_crystal_people = indigo.join_cult(crystal_people)
indigo_big_tent = BloodOath.new("01-01-2017", big_tent, indigo)
indigo_green_street_hooligans = green_street_hooligans.recruit_follower(indigo)
eleanor_crystal_people = BloodOath.new("12-25-1996", crystal_people, eleanor)
keith_green_street_hooligans = keith.join_cult(green_street_hooligans)

binding.pry

Cult.all
# => [#<Cult:0x00007fbcf3934830
#   @founding_year=1997,
#   @location="Green Street, duh",
#   @name="The Hooligans of Green Street",
#   @slogan="We're just here to feel alive">,
#  #<Cult:0x00007fbcf3934678 @founding_year=1988, @location="LA, baby", @name="The Crystal People", @slogan="We're, like, extra special">,
#  #<Cult:0x00007fbcf3934498 @founding_year=2001, @location="Taos", @name="The People of the Big Tent", @slogan="Wanna come sit in the tent?">]

Cult.find_by_name("The Crystal People")
# => #<Cult:0x00007fbcf3934678 @founding_year=1988, @location="LA, baby", @name="The Crystal People", @slogan="We're, like, extra special">

Cult.find_by_location("Taos")
#=> [#<Cult:0x00007ff8251a07a0 @founding_year=2001, @location="Taos", @name="The People of the Big Tent", @slogan="Wanna come sit in the tent?">]

Cult.find_by_founding_year(1997)
# => [#<Cult:0x00007fdb47142448
#   @founding_year=1997,
#   @location="Green Street, duh",
#   @name="The Hooligans of Green Street",
#   @slogan="We're just here to feel alive">,
#  #<Cult:0x00007fdb47142380 @founding_year=1997, @location="LA, baby", @name="The Crystal People", @slogan="We're, like, extra special">]

BloodOath.all
# => [#<BloodOath:0x00007fbcf40dfbe8
#   @cult=#<Follower:0x00007fbcf39343f8 @age=27, @life_motto="Be free!", @name="Jenna (Rainbow) McKibbens">,
#   @follower=#<Cult:0x00007fbcf3934678 @founding_year=1988, @location="LA, baby", @name="The Crystal People", @slogan="We're, like, extra special">,
#   @initiation_date="10-23-2106">,
#  #<BloodOath:0x00007fbcf40dfb70
#   @cult=#<Cult:0x00007fbcf3934498 @founding_year=2001, @location="Taos", @name="The People of the Big Tent", @slogan="Wanna come sit in the tent?">,
#   @follower=#<Follower:0x00007fbcf40dfd50 @age=44, @life_motto="Aliens, man, aliens.", @name="Tom Delonge">,
#   @initiation_date="2019-09-23">,
#  #<BloodOath:0x00007fbcf40dfaa8
#   @cult=
#  #<BloodOath:0x00007fbcf40df800
#   @cult=#<Follower:0x00007fbcf40dfdc8 @age=33, @life_motto="I see vibrations", @name="Eleanor Smith-Jones">,
#   @follower=#<Cult:0x00007fbcf3934678 @founding_year=1988, @location="LA, baby", @name="The Crystal People", @slogan="We're, like, extra special">,
#   @initiation_date="12-25-1996">,
#  #<BloodOath:0x00007fbcf40df738
#   @cult=
#    #<Cult:0x00007fbcf3934830
#     @founding_year=1997,
#     @location="Green Street, duh",
#     @name="The Hooligans of Green Street",
#     @slogan="We're just here to feel alive">,
#   @follower=#<Follower:0x00007fbcf40dfc88 @age=37, @life_motto="I will be ready when they arrive!", @name="Keith McKenzie">,
#   @initiation_date="2019-09-23">]

Follower.all
# => [#<Follower:0x00007fbcf39343f8 @age=27, @life_motto="Be free!", @name="Jenna (Rainbow) McKibbens">,
#  #<Follower:0x00007fbcf3936a40 @age=34, @life_motto="Take it easy, baby!", @name="Indigo McTavish">,
#  #<Follower:0x00007fbcf40dff08 @age=32, @life_motto="No.", @name="Harold Gunderson">,
#  #<Follower:0x00007fbcf40dfe68 @age=28, @life_motto="We just all gotta, like, find what works, you know man?", @name="Ethan F. Anderson">,
#  #<Follower:0x00007fbcf40dfdc8 @age=33, @life_motto="I see vibrations", @name="Eleanor Smith-Jones">,
#  #<Follower:0x00007fbcf40dfd50 @age=44, @life_motto="Aliens, man, aliens.", @name="Tom Delonge">,
#  #<Follower:0x00007fbcf40dfc88 @age=37, @life_motto="I will be ready when they arrive!", @name="Keith McKenzie">]

crystal_people.name
# => "The Crystal People"

green_street_hooligans.location
# 

big_tent.founding_year
# => 2001

crystal_people.slogan
# => "We're, like, extra special"

crystal_people.cult_population
# 

indigo.cults
# => [#<Cult:0x00007fdb47142380 @founding_year=1997, @location="LA, baby", @name="The Crystal People", @slogan="We're, like, extra special">,
#  #<Cult:0x00007fdb471422e0 @founding_year=2001, @location="Taos", @name="The People of the Big Tent", @slogan="Wanna come sit in the tent?">,
#  #<Cult:0x00007fdb47142448
#   @founding_year=1997,
#   @location="Green Street, duh",
#   @name="The Hooligans of Green Street",
#   @slogan="We're just here to feel alive">]

Follower.of_a_certain_age(30)
# => [#<Follower:0x00007fd116136048 @age=34, @life_motto="Take it easy, baby!", @name="Indigo McTavish">,
#  #<Follower:0x00007fd116135fd0 @age=32, @life_motto="No.", @name="Harold Gunderson">,
#  #<Follower:0x00007fd116135ee0 @age=33, @life_motto="I see vibrations", @name="Eleanor Smith-Jones">,
#  #<Follower:0x00007fd116135e68 @age=44, @life_motto="Aliens, man, aliens.", @name="Tom Delonge">,
#  #<Follower:0x00007fd116135df0 @age=37, @life_motto="I will be ready when they arrive!", @name="Keith McKenzie">]

puts "Mwahahaha!" # just in case pry is buggy and exits
