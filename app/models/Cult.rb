class Cult
  attr_reader :founding_year
  attr_accessor :name, :location, :slogan
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

  def recruit_follower(follower)
    BloodOath.new(self, follower, Time.now.strftime("%m/%d/%Y"))
  end

  def blood_oaths
    BloodOath.all.select do |blood_oath|
      blood_oath.cult == self
    end
  end

  def followers 
    blood_oaths.map(&:follower)
  end

  def cult_population
    followers.count
  end

  def self.find_by_name(name)
    self.all.find do |cult|
      cult.name == name
    end
  end

  def self.find_by_location(location)
    self.all.select do |cult|
      cult.location == location
    end
  end

  def self.find_by_year(year)
    self.all.select do |cult|
      cult.year == year
    end
  end

  def average_age
    sum = self.followers.map(&:age).reduce(0) do |sum_of_ages, age|
      sum_of_ages + age
    end

    sum.to_f / self.cult_population
  end

  def self.least_popular
    self.all.min do |cult_a, cult_b|
      cult_a.cult_population <=> cult_b.cult_population
    end
  end

  def self.most_common_location
    locations = self.all.map(&:location).uniq
    loc_count = locations.map do |loc|
      {loc => self.find_by_location(loc).count}
    end
    max_hash = loc_count.max_by { |loc, count| count }
    max_hash.keys.first
  end
end