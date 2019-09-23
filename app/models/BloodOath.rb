class BloodOath

    attr_reader :initiation_date, :cult, :follower

    @@all = []

    def initialize(cult, follower)
        @initiation_date = Time.now.strftime("%Y/%m/%d")
        @cult = cult
        @follower = follower
        @@all << self
    end

    def self.all
        @@all
    end

    def self.first_oath
        self.all.first.follower
    end


end