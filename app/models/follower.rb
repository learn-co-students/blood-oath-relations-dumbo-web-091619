class Follower

	attr_reader :follower_name
	attr_accessor :age, :motto

	@@all = []

	def initialize(follower_name, age, motto)
		@motto = motto
		@age = age
		@follower_name = follower_name
		@@all << self
	end

	def cults
		BloodOath.all.select { |oaths| oaths.follower.follower_name == self.follower_name }
	end

	def join_cult(cult)
		BloodOath.new(self, cult, rand(1975..2019))
	end

	def self.of_a_certain_age(n)
		Follower.all.select { |follower| follower.age > n }
	end

	def my_cults_slogan
		cults().map { |cult| cult.cult.slogan }
	end

	def self.most_active
		count = Hash.new(0)

		BloodOath.all.each { |oaths| count[oaths.follower.follower_name] += 1 }

		most = count.sort_by { |k, v| v }[-1][0]

		Follower.all.select { |follower| follower.follower_name == most }
	end

	def self.top_ten
		count = Hash.new(0)
		top_ten_array = []
		i = 0

		BloodOath.all.each { |oaths| count[oaths.follower.follower_name] += 1 }

		most = count.sort_by { |k, v| v }.reverse

		while i < 10
			top_ten_array << most[i][0]
		i += 1
		end

		top_ten_array
	end

	def self.all
		@@all
	end

end