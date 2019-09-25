class Cult

    attr_reader :name, :location, :founding_year, :slogan

    @@all = []

    def initialize(name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @@all << self
    end

    def self.all
        @@all
    end

    def bloodoaths
        BloodOath.all.select {|cult_name| cult_name.cults == self}
    end

    def followers
        bloodoaths.map {|oath| oath.followers}
    end

    def recruit_follower(follower)
        BloodOath.new("2019-09-24", self, follower) 
    end

end