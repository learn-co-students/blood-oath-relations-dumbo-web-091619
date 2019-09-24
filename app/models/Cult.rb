# **`Cult`**

## initialize:
## * `Cult#name`
#   * returns a `String` that is the cult's name
## * `Cult#location`
#   * returns a `String` that is the city where the cult is located
## * `Cult#founding_year`
#   * returns a `Fixnum` that is the year the cult was founded
## * `Cult#slogan`
#   * returns a `String` that is this cult's slogan
## * `Cult#recruit_follower`
#   * takes in an argument of a `Follower` instance and adds them to this cult's list of followers
## * `Cult#cult_population`
#   * returns a `Fixnum` that is the number of followers in this cult
## * `Cult.all`
#   * returns an `Array` of all the cults
# * `Cult.find_by_name`
#   * takes a `String` argument that is a name and returns a `Cult` instance whose name matches that argument
# * `Cult.find_by_location`
#   * takes a `String` argument that is a location and returns an `Array` of cults that are in that location
# * `Cult.find_by_founding_year`
#   * takes a `Fixnum` argument that is a year and returns all of the cults founded in that year


# cult shouldn't store followers, only oaths

require 'date'
class Cult

    attr_reader :name, :location, :founding_year, :slogan, :minimum_age
    @@all = []

    def initialize(name, location, founding_year, slogan, minimum_age = 18)
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

    ## see updated recruit_follower method at bottom of page

    # def recruit_follower(new_follower)
    # #   * takes in an argument of a `Follower` instance and adds them to this cult's list of followers
    #     BloodOath.new(Date.today.to_s, self, new_follower)
    # end

    def cult_population
    #   * returns a `Fixnum` that is the number of followers in this cult
        cult_oaths = BloodOath.all.select do |blood_oath|
            blood_oath.cult == self
        end
        cult_oaths.length
    end


    def self.find_by_name(cult_name)
    #   * takes a `String` argument that is a name and returns a `Cult` instance whose name matches that argument
        all.find do |cult|
            cult.name == cult_name
        end
    end

    def self.find_by_location(cult_location)
    #   * takes a `String` argument that is a location and returns an `Array` of cults that are in that location
        all.select do |cult|
            cult.location == cult_location
        end
    end

    def self.find_by_founding_year(founding_year_fixnum)
    #   * takes a `Fixnum` argument that is a year and returns all of the cults founded in that year
        all.select do |cult|
            cult.founding_year == founding_year_fixnum
        end
    end

#       Advanced Methods
#     * `Cult#average_age`
#     * returns a `Float` that is the average age of this cult's followers
#     * `Cult#my_followers_mottos`
#     * prints out all of the mottos for this cult's followers
#     * `Cult.least_popular`
#     * returns the `Cult` instance who has the least number of followers :(
#     * `Cult.most_common_location`
#     * returns a `String` that is the location with the most cults

    def oaths
    #   helper file
        BloodOath.all.select do |blood_oath|
            blood_oath.cult == self
        end
    end

    def average_age
    #     * returns a `Float` that is the average age of this cult's followers
        ages = self.oaths.map do |oath|
            oath.follower.age
        end 
        ages.reduce(0){|sum, age| sum + age} / ages.length.to_f
    end

    def my_followers_mottos
    #     * prints out all of the mottos for this cult's followers
        self.oaths.map do |oath|
            oath.follower.life_motto
        end
    end

    def self.least_popular
    #     * returns the `Cult` instance who has the least number of followers :(
        cults = @@all.map do |cult|
                [cult, cult.oaths.length]
            end
            cults_hash = Hash.new{|cults_hash, key| cults_hash[key] = []}
            cults.each{ |key, value| cults_hash[key] << value}
            cults_hash.key(cults_hash.values.min)
    end

    def self.most_common_location
    #     * returns a `String` that is the location with the most cults
        cults = @@all.map do |cult|
            cult.location
        end
        cults_hash = cults.uniq.map{|cult_location| [cult_location, cults.count(cult_location)]}.to_h
        cults_hash.key(cults_hash.values.max)
    end

      ## Bonus Methods

#     * `Cult#minimum_age`
#     * returns a `Fixnum` that is the minimum age required for followers joining this cult
#     * `Cult#recruit_follower`
#     * takes in an argument of a `Follower` instance and adds them to this cult's list of followers
#     * NOW this is changed such that if the given `Follower` instance is not of age:
#     * do not let them join the cult
#     * print out a friendly message informing them that they are too young


 def recruit_follower(new_follower)
    #   * takes in an argument of a `Follower` instance and adds them to this cult's list of followers
        if new_follower.age > @minimum_age
            BloodOath.new(Date.today.to_s, self, new_follower)
        else
            p "I'm sorry, you are too young to join our community. Please come visit us again in #{@minimum_age - new_follower.age} year(s)!"
        end
    end
end