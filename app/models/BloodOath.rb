# **`BloodOath`**

# * `BloodOath#initiation_date`
#   * returns a `String` that is the initiation date of this blood oath in the format _YYYY-MM-DD_.
# * `BloodOath.all`
#   * returns an `Array` of all the blood oaths
require 'date'

class BloodOath

    attr_reader :initiation_date, :cult, :follower
    
    @@all = []

    def initialize(initiation_date = Date.today.to_s, cult, follower)
        @initiation_date = initiation_date
        @cult = cult
        @follower = follower
        @@all << self
    end

    def self.all
        @@all
    end

    # Advanced Methods

# * `BloodOath.first_oath`
# * returns the `Follower` instance for the follower that made the very first blood oath

    def self.first_oath
        initiation_dates = all.map do |blood_oath|
            blood_oath.initiation_date
            end
            initiation_dates.min
    end 

end