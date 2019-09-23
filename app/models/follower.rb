class Follower

  attr_reader :name, :age, :life_motto
  @@all = []

  def initialize(name, age, motto)
  # * `Follower#name`
  #   * returns a `String` that is the follower's name

  # * `Follower#age`
  #   * returns a `Fixnum` that is the age of the follower

  # * `Follower#life_motto`
  #   * returns a `String` that is the follower's life motto
    @name = name
    @age = age
    @life_motto = motto
    @@all << self
  end


  def self.all
    # * `Follower.all`
    #   * returns an `Array` of all the followers
    @@all
  end


  def all_follower_bloodoaths
    # This is a helper method to return all bloodoaths that a follower has made
    BloodOath.all.filter { |oath| oath.follower == self }
  end


  def cults
  # * `Follower#cults`
  #   * returns an `Array` of this follower's cults
    all_follower_bloodoaths.map { |oath| oath.cult }
  end

  def join_cult(cult)
  # * `Follower#join_cult`
  #   * takes in an argument of a `Cult` instance and adds this follower to the cult's list of followers
    if self.age < cult.minimum_age
      puts "Try again when you're older"
    else
      BloodOath.new(Time.now.to_s, self, cult)
    end
  end

  def self.of_a_certain_age(age)
  # * `Follower.of_a_certain_age`
  #   * takes a `Fixnum` argument that is an age and returns an `Array` of followers who are the given age or older
    Follower.all.filter { |follower| follower.age >= age.to_i }.sort_by { |follower| follower.age }
  end


  def my_cults_slogans
    # * `Follower#my_cults_slogans`
    #   * prints out all of the slogans for this follower's cults
    cults.map { |cult| cult.slogan  }
  end


  def self.follower_activity_sort
     follower_activity = self.all.map do |follower|
       {follower => follower.cults.length}
     end
     sorted_follower_activity = follower_activity.sort_by do |follower|
       follower.values[0]
     end
     sorted_follower_activity
  end


  def self.most_active
    # * `Follower.most_active`
    #   * returns the `Follower` instance who has joined the most cults

    Follower.follower_activity_sort[-1]
  end


  def self.top_ten
    # * `Follower.top_ten`
    #   * returns an `Array` of followers; they are the ten most active followers
    Follower.follower_activity_sort.reverse[0..9]
  end


  def fellow_cult_members
  # * `Follower#fellow_cult_members`
  #   * returns a unique `Array` of followers who are in the same cults as you
    BloodOath.all.filter { |oath| self.cults.include? oath.cult and oath.follower != self }.map { |oath| oath.follower }.uniq
  end
end
