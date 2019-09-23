class BloodOath

  attr_reader :initiation_date, :follower, :cult
  @@all = []


  def initialize(initiation_date, follower, cult)
  # * `BloodOath#initiation_date`
  #   * returns a `String` that is the initiation date of this blood oath in the format _YYYY-MM-DD_.
  # Follower is an instance of the Follower class
  # Cult is an instance of the cult class
  
    @initiation_date = initiation_date
    @follower = follower
    @cult = cult
    @@all << self
  end



  def self.all
  # * `BloodOath.all`
  #   * returns an `Array` of all the blood oaths
    @@all
  end


  def self.first_oath
  # * `BloodOath.first_oath`
  #   * returns the `Follower` instance for the follower that made the very first blood oath
  #   Follower.all.
  end
end
