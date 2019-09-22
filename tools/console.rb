require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end


follower1 = Follower.new("Follower1_Name", 21, "Motto_1")
follower2 = Follower.new("Follower2_Name", 54, "Motto_2")
follower3 = Follower.new("Follower3_Name", 85, "Motto_3")
follower4 = Follower.new("Follower4_Name", 12, "Motto_4")
follower5 = Follower.new("Follower5_Name", 67, "Motto_5")
follower6 = Follower.new("Follower6_Name", 24, "Motto_6")
follower7 = Follower.new("Follower7_Name", 45, "Motto_7")
follower8 = Follower.new("Follower8_Name", 32, "Motto_8")
follower9 = Follower.new("Follower9_Name", 86, "Motto_9")
follower10 = Follower.new("Follower10_Name", 68, "Motto_10")
follower11 = Follower.new("Follower11_Name", 47, "Motto_11")
follower12 = Follower.new("Follower12_Name", 14, "Motto_12")
follower13 = Follower.new("Follower13_Name", 25, "Motto_13")
follower14 = Follower.new("Follower14_Name", 92, "Motto_14")
follower15 = Follower.new("Follower15_Name", 6, "Motto_15")

cult1 = Cult.new("Cult1_Name", "Kansas", 1978, "Slogan_1")
cult2 = Cult.new("Cult2_Name", "Oregon", 1999, "Slogan_2")
cult3 = Cult.new("Cult3_Name", "California", 2010, "Slogan_3")
cult4 = Cult.new("Cult4_Name", "Florida", 1950, "Slogan_4")
cult5 = Cult.new("Cult5_Name", "Kansas", 1888, "Slogan_5")

oath1 = BloodOath.new(follower1, cult5, 2012)
oath2 = BloodOath.new(follower2, cult4, 2013)
oath3 = BloodOath.new(follower3, cult3, 2014)
oath4 = BloodOath.new(follower4, cult2, 2015)
oath5 = BloodOath.new(follower5, cult1, 2016)
oath6 = BloodOath.new(follower6, cult1, 2009)
oath7 = BloodOath.new(follower7, cult2, 2017)
oath8 = BloodOath.new(follower8, cult4, 2018)
oath9 = BloodOath.new(follower9, cult5, 2011)
oath10 = BloodOath.new(follower10, cult2, 1994)
oath11 = BloodOath.new(follower11, cult3, 1992)
oath12 = BloodOath.new(follower12, cult5, 1984)
oath13 = BloodOath.new(follower13, cult1, 1950)
oath14 = BloodOath.new(follower14, cult4, 1967)
oath15 = BloodOath.new(follower15, cult5, 2001)
oath16 = BloodOath.new(follower2, cult5, 2002)
oath17 = BloodOath.new(follower5, cult5, 1983)
oath18 = BloodOath.new(follower1, cult5, 1998)
oath19 = BloodOath.new(follower3, cult5, 1947)
oath20 = BloodOath.new(follower10, cult5, 1923)
oath21 = BloodOath.new(follower15, cult5, 1961)
oath22 = BloodOath.new(follower2, cult5, 1977)
oath23 = BloodOath.new(follower4, cult5, 1981)
oath24 = BloodOath.new(follower1, cult5, 1972)
oath25 = BloodOath.new(follower3, cult5, 1990)

binding.pry

puts "Mwahahaha!"
