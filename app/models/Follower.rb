# **`Follower`**

## * `Follower#name`
#   * returns a `String` that is the follower's name
## * `Follower#age`
#   * returns a `Fixnum` that is the age of the follower
## * `Follower#life_motto`
#   * returns a `String` that is the follower's life motto
## * `Follower#cults`
#   * returns an `Array` of this follower's cults
# * `Follower#join_cult`
#   * takes in an argument of a `Cult` instance and adds this follower to the cult's list of followers
## * `Follower.all`
#   * returns an `Array` of all the followers
## * `Follower.of_a_certain_age`
#   * takes a `Fixnum` argument that is an age and returns an `Array` of followers who are the given age or older

# followers shouldn't store cults, only oaths

require 'date'
class Follower
    attr_reader :name, :age, :life_motto 
    @@all = []

    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        @@all << self
    end

    def self.all
        @@all
    end

    ## see updated join_cult method at bottom of page

    # def join_cult(new_cult)
    #     # follows single source of truth: many ~*~connecting~*~ to many via the dongle class
    #     BloodOath.new(Date.today.to_s, new_cult, self)
    # end

    def cults
    #   * returns an `Array` of this follower's cults
    # follows single source of truth
        my_oaths = BloodOath.all.select do |blood_oath|
            blood_oath.follower == self
        end
        my_cults = my_oaths.map do |my_oath|
            my_oath.cult
        end
        my_cults
    end

    def self.of_a_certain_age(follower_age)
    #   * takes a `Fixnum` argument that is an age and returns an `Array` of followers who are the given age or older
        all.select do |follower|
            follower.age >= follower_age
        end
    end


    # Advanced Methods


# * `Follower#my_cults_slogans`
# * prints out all of the slogans for this follower's cults
# * `Follower.most_active`
# * returns the `Follower` instance who has joined the most cults
# * `Follower.top_ten`
# * returns an `Array` of followers; they are the ten most active followers

    def my_cults_slogans
        self.cults.map do |cult|
            cult.slogan
        end
    end

    # def self.most_active
    #     members = @@all.map do |member|
    #         [member, member.cults.length]
    #     end
    #     members_hash = Hash.new{|members_hash, key| members_hash[key] = []}
    #     members.each{ |key, value| members_hash[key] << value}
    #     members_hash.key(members_hash.values.max)
    # end

    # improved self.most_active :)
    def self.most_active
        @@all.max_by{|member| member.cults.length}
    end

    # def self.top_ten
    #     members = @@all.map do |member|
    #         [member, member.cults.length]
    #     end
    #     members_hash = Hash.new{|members_hash, key| members_hash[key] = []}
    #     members.each{|key, value| members_hash[key]<< value}
    #     top_ten_hash = members_hash.sort_by{|key, value| value}.reverse.to_h
    #     top_ten_hash.keys.first(10)
    # end

    # improved self.top_ten :)
    def self.top_ten
        members = @@all.sort_by{|member| member.cults.length}
         members[-10..-1].reverse
    end 

#     * `Follower#fellow_cult_members`
#   * returns a unique `Array` of followers who are in the same cults as you

    def fellow_cult_members
        my_cults_oaths = self.cults.map do |cult|
            cult.oaths
        end
        flat_oaths = my_cults_oaths.flatten
        fellow_followers = flat_oaths.map do |oath|
            oath.follower
        end
        fellow_followers
    end

      ## Bonus Methods

#     * `Follower#join_cult`
#     * takes in an argument of a `Cult` instance and adds this follower to the cult's list of followers
#     * NOW this is changed such that if you don't meet the minimum age requirement of the given `Cult` instance:
#     * do not let them join the cult
#     * print out a friendly message informing them that they are too young


    def join_cult(new_cult)
        # follows single source of truth: many ~*~connecting~*~ to many via the dongle class
        if @age > new_cult.minimum_age
        BloodOath.new(Date.today.to_s, new_cult, self)
        else 
            p "I'm sorry, you are too young to join our community. Please come visit us again in #{new_cult.minimum_age - @age} year(s)!"
        end
    end

end

