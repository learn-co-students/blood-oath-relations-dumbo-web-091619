class BloodOath

	attr_reader :follower, :cult, :initiation_year

	@@all = []

	def initialize(follower, cult, initiation_year)
		@initiation_year = initiation_year
		@cult = cult
		@follower = follower
		@@all << self
	end

	def initiation_date
		"#{Time.now.year}-#{Time.now.month}-#{Time.now.day}"
	end

	def self.first_oath
		first_oath = BloodOath.all.map { |oath| oath.initiation_year }.sort[0]

		BloodOath.all.select { |oath| oath.initiation_year == first_oath }
	end

	def self.all
		@@all
	end

end