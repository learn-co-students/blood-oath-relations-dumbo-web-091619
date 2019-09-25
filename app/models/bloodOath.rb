class BloodOath

    attr_reader :initiation_date, :cults, :followers

    @@all = []

    def initialize(init_date, cult, follower)
        @initiation_date = init_date
        @cults = cult
        @followers = follower
        @@all << self
    end

    def self.all
        @@all
    end

end