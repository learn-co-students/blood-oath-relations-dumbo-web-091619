require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console


# name, location, founding_year, slogan

a = Cult.new("Satanists", "def", "123", "Try harder")
b = Cult.new("Hedonists", "fgh", "567", "Do more")
c = Cult.new("Republicans", "jkl", "910", "Try more")
x = Cult.new("Libertarians", "jkl", "910", "Try Try")

# name, age, motto

d = Follower.new("Larry", 21, "Carpe Diem")
e = Follower.new("Harry", 12, "Yolo")
f = Follower.new("Barry", 49, "Whatever")
g = Follower.new("Mary", 99, "Die trying")
h = Follower.new("Carey", 36, "Aim high")
j = Follower.new("Perry", 27, "Sleep when you're dead")
z = Follower.new("Corey", 12, "I like to join things")


# initiation_date, follower, cult

k = BloodOath.new(Time.now.to_s, f, a)
l = BloodOath.new(Time.now.to_s, d, a)
m = BloodOath.new(Time.now.to_s, e, b)
n = BloodOath.new(Time.now.to_s, f, b)
p = BloodOath.new(Time.now.to_s, d, b)
q = BloodOath.new(Time.now.to_s, e, c)
r = BloodOath.new(Time.now.to_s, g, c)
s = BloodOath.new(Time.now.to_s, h, x)
t = BloodOath.new(Time.now.to_s, j, a)

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
