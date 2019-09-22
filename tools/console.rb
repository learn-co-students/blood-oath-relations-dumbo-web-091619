require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

lorde = Cult.new("Cult Lorde", "NY", 1990, "Be Royal", 18)
jagger = Cult.new("Stones Cult", "LA", 1980, "Something with a stone")
bowie = Cult.new("Cult of Oddity", "Space", 1970, "Where you at, Tom")
nicks = Cult.new("Fleetwood", "LA", 1994, "Rhiannon", 15)

steve = Follower.new("Steve", 25, "Sup Im steve")
anton = Follower.new("Anton", 21, "anton is here")
jill = Follower.new("Jill", 33, "Hey yall")
abe = Follower.new("Abe", 43, "Algorith")
ben = Follower.new("Ben", 33, "im ben")
cary = Follower.new("Cary", 13, "this is a cary")
dave = Follower.new("Dave", 43, "Hsdfkll")
enes = Follower.new("Enes", 25, "Heyll")
frank = Follower.new("Frank", 38, "Gore all")
geoff = Follower.new("Geoff", 63, "RT all")
henry = Follower.new("Henry", 53, "Henry bob")

j_lorde = jill.join_cult(lorde)
s_jagger = steve.join_cult(jagger)
a_bowie = anton.join_cult(bowie)
a_lorde = anton.join_cult(lorde)
j_bowie = jill.join_cult(bowie)
ab_lorde = abe.join_cult(lorde)
b_nicks = ben.join_cult(nicks)
#c_nicks = cary.join_cult(nicks)
d_lorde = dave.join_cult(lorde)
e_bowie = enes.join_cult(bowie)
h_bowie = henry.join_cult(bowie)
ab_nicks = abe.join_cult(nicks)
f_lorde = frank.join_cult(lorde)
h_nicks = henry.join_cult(nicks)
ab_bowie = abe.join_cult(bowie)
h_lorde = henry.join_cult(lorde)
e_jagger = enes.join_cult(jagger)



binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
