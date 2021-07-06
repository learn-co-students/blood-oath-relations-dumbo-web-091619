require 'pry'
class Cult
    attr_reader :name, :location, :founding_year, :slogan, :minimum_age
    attr_accessor :list_of_followers
    @@all = []

    def initialize(name, location, founding_year, slogan, minimum_age=21)
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

    def self.find_by_name(name)
        Cult.all.find{|cult| cult.name == name}
    end

    def find_by_location(location)
        Cult.all.find{|cult| cult.location == location}
    end

    def find_by_founding_year(year)
        Cult.all.find{|cult| cult.founding_year == year}
    end

    def self.most_common_location
        locations = Cult.all.map{|cult| cult.location}
        mostcommon=locations.map{|location| locations.count(location) }.max
        locations.find{|location| locations.count(location) == mostcommon}
    end

    def recruit_follower(follower)
        BloodOath.new(follower, self)
    end

    def cult_population
        self.followers.size
    end

    def followers
        BloodOath.all.select{|oath| oath.cult == self}.map{|oath| oath.follower}
    end

    def average_age
        self.followers.map{|follower| follower.age}.reduce(0){|sum, num| sum + num}/self.followers.size
    end

    def my_followers_mottos
        self.followers.map{|follower| follower.life_motto}
    end

    def self.least_popular
        least = BloodOath.all.map{|oath| oath.cult.followers.size}.min
        Cult.all.find{|cult| cult.followers.size == least}
    end



end