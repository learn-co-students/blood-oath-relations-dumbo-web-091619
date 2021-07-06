class BloodOath
    attr_reader :initiation_date, :cult, :follower
    attr_accessor

    @@all = []

    def initialize(follower, cult, date=Time.now)
        @cult = cult
        @follower = follower
        @initiation_date = date
        @@all << self
    end

    def self.all
        @@all
    end

    def self.first_oath
        @@all.first
    end

end