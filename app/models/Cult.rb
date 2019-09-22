require 'date'
class Cult

    attr_accessor :name, :location, :founding_year, :slogan, :minimum_age
    @@all = []

    def initialize(name, location, founding_year, slogan, minimum_age = 0)
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

    def recruit_follower(person)
      if person.age < self.minimum_age
        return "Sorry, recruit does not fulfill the age requirement for the cult."
      else 
        BloodOath.new(self, person, Date.today.to_s)
      end
    end

    def cult_population
      @population = self.oaths.count
      @population
    end

    def oaths
      BloodOath.all.select {|oath| oath.cult == self}.uniq
    end

    def members
      self.oaths.map {|oath| oath.follower}.uniq
    end

    def self.find_by_name(name)
      Cult.all.find {|cult| cult.name == name}
    end

    def self.find_by_location(location)
      Cult.all.select {|cult| cult.location == location}
    end

    def self.find_by_founding_year(year)
      Cult.all.select {|cult| cult.founding_year == year}
    end

    def average_age
      total_age = 0
      self.members.each do |member|
          total_age += member.age 
      end
      total_age/self.members.count
    end

    def my_followers_mottos
      self.members.map do |member|
          member.life_motto
      end
    end

    def self.least_popular
      pop = 9999
      bad_cult = nil
      Cult.all.each do |cult|
        if cult.members.count < pop
          pop = cult.members.count
          bad_cult = cult
        end
      end
      bad_cult
    end
    
    def self.most_common_location
      all_localations = Cult.all.map do |cult|
        cult.location
      end
      all_localations.max_by {|location| all_localations.count(location) }
    end 

end
