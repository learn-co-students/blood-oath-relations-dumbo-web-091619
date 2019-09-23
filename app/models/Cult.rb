class Cult

    attr_accessor :minimum_age
    attr_reader :name, :location, :founding_year, :slogan

    @@all = []

    def initialize(name, location, founding_year, slogan, minimum_age = 21)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @minimum_age = minimum_age
        @@all << self
    end

    def recruit_follower(follower)
        if follower.age >= self.minimum_age
            BloodOath.new(self, follower)
        else
            puts "I'm sorry, but you are too young to join this cult."
        end
    end

    def blood_oaths
        BloodOath.all.select do |blood_oath|
            blood_oath.cult == self
        end
    end

    def followers
        blood_oaths.map do |oath|
            oath.follower
        end
    end

    def cult_population
        followers.length
    end

    def self.all
        @@all
    end

    def self.find_by_name(cult_name)
        self.all.find do |cult|
            cult.name == cult_name
        end
    end

    def self.find_by_location(cult_location)
        self.all.select do |cult|
            cult.location == cult_location
        end
    end

    def self.find_by_founding_year(cult_founding_year)
        self.all.select do |cult|
            cult.founding_year == cult_founding_year
        end
    end

    def ages
        followers.map do |follower|
            follower.age
        end
    end

    def average_age
        sum_of_ages = ages.inject do |sum, age|
            sum + age
        end
        sum_of_ages.to_i / ages.length
    end

    def my_followers_mottos
        followers.map do |follower|
            follower.life_motto
        end
    end

    def self.least_popular
        lowest_population = 100
        least_popular_cult = nil
        self.all.each do |cult|
            if cult.cult_population < lowest_population
                lowest_population = cult.cult_population
                least_popular_cult = cult
            end
        end
        least_popular_cult
    end

    def self.locations
        self.all.map do |cult|
            cult.location
        end
    end

    def self.most_common_location
        number_of_occurences = 0
        most_popular_location = nil
        self.locations.each do |location|
            if locations.count(location) > number_of_occurences
                number_of_occurences = locations.count(location)
                most_popular_location = location
            end
        end
        most_popular_location
    end

end