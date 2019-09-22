class Cult

	attr_reader  :location, :founding_year
	attr_accessor :cult_name, :slogan

	@@all = []

	def initialize(cult_name, location, founding_year, slogan)
		@slogan = slogan
		@founding_year = founding_year
		@location = location
		@cult_name = cult_name
		@@all << self
	end

	def recruit_follower(follower)
		BloodOath.new(follower, self, rand(1975..2019))
	end

	def followers
		BloodOath.all.select { |oaths| oaths.cult.cult_name == self.cult_name }
	end

	def self.find_by_name(name)
		Cult.all.select { |cult| cult.cult_name == name}
	end

	def self.find_by_location(cult_place)
		Cult.all.select { |cult| cult.location == cult_place }
	end

	def self.find_by_founding_year(year)
		Cult.all.select { |cult| cult.founding_year == year }
	end

	def average_age
		sum = 0
		followers().map { |oaths| sum += oaths.follower.age }
		sum / followers.length
	end

	def my_followers_mottos
		followers().map { |oaths| oaths.follower.motto }
	end

	def self.least_popular
		count = Hash.new(0)

		BloodOath.all.each {|oaths| count[oaths.cult.cult_name] += 1 }

		least = count.sort_by { |k, v| v }[0][0]

		Cult.all.select { |cults| cults.cult_name == least }
	end

	def self.most_common_location
		count = Hash.new(0)

		BloodOath.all.each {|oaths| count[oaths.cult.location] += 1 }

		most = count.sort_by { |k, v| v }[-1][0]
	end

	def self.all
		@@all
	end

end