class Cult

  attr_reader :name, :location, :founding_year, :slogan, :minimum_age
  @@all = []

  def initialize(name, location, founding_year, slogan, minimum_age=13)
    # * `Cult#name`
    #   * returns a `String` that is the cult's name
    #
    # * `Cult#location`
    #   * returns a `String` that is the city where the cult is located
    #
    # * `Cult#founding_year`
    #   * returns a `Fixnum` that is the year the cult was founded
    #
    # * `Cult#slogan`
    #   * returns a `String` that is this cult's slogan
    @name = name
    @location = location
    @founding_year = founding_year
    @slogan = slogan
    @minimum_age = minimum_age
    @@all << self
  end


  def self.all
    @@all
  end


  def recruit_follower(follower_instance, time_stamp)
  # * `Cult#recruit_follower`
  #   * takes in an argument of a `Follower` instance and adds them to this cult's list of followers
  #   * if the given `Follower` instance is not of age:
  #     * do not let them join the cult
  #     * print out a friendly message informing them that they are too young
    if follower_instance.age < self.minimum_age
      puts "Come back when you're older, kid."
    else
      BloodOath.new(time_stamp, follower_instance, self)
      puts "This is where I am."
    end
  end


  def cult_population
  # * `Cult#cult_population`
  #   * returns a `Fixnum` that is the number of followers in this cult
    BloodOath.all.filter { |oath| oath.cult == self }.size
  end


  def self.find_by_name(cult_name)
  # * `Cult.find_by_name`
  #   * takes a `String` argument that is a name and returns a `Cult` instance whose name matches that argument
    Cult.all.filter { |cult| cult.name == cult_name }
  end


  def self.find_by_location(location_string)
    # * `Cult.find_by_location`
    #   * takes a `String` argument that is a location and returns an `Array` of cults that are in that location
    Cult.all.filter { |cult| cult.location == location_string }
  end


  def self.find_by_founding_year(year_string)
    # * `Cult.find_by_founding_year`
    #   * takes a `Fixnum` argument that is a year and returns all of the cults founded in that year
    Cult.all.filter { |cult| cult.founding_year == year_string.to_s }
  end


  def average_age
  # * `Cult#average_age`
  #   * returns a `Float` that is the average age of this cult's followers
    ages = BloodOath.all.filter { |oath| oath.cult == self }.map { |oath| oath.follower.age }
    ages.sum / ages.size.to_f
  end


  def my_followers_mottos
  # * `Cult#my_followers_mottos`
  #   * prints out all of the mottos for this cult's followers
    BloodOath.all.filter { |oath| oath.cult == self }.map { |oath| oath.follower.life_motto }
  end


  def self.least_popular
  # * `Cult.least_popular`
  #   * returns the `Cult` instance who has the least number of followers :(

    Cult.all.min_by { |cult| cult.cult_population }
  end


  def self.most_common_location
    # Still a work in progress
  # * `Cult.most_common_location`
  #   * returns a `String` that is the location with the most cults
    Cult.all.map { |cult| cult.location }.sort.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
  end


  def minimum_age
    # * `Cult#minimum_age`
    #   * returns a `Fixnum` that is the minimum age required for followers joining this cult
    @minimum_age
  end
end
