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

    def join_cult(new_cult)
        # follows single source of truth: many ~*~connecting~*~ to many via the dongle class
        BloodOath.new(Date.today.to_s, new_cult, self)
    end

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

    def self.most_active
        members = @@all.map do |member|
            [member, member.cults.length]
        end
        members_hash = Hash.new{|members_hash, key| members_hash[key] = []}
        members.each{ |key, value| members_hash[key] << value}
        members_hash.key(members_hash.values.max)
    end

    def self.top_ten
        members = @@all.map do |member|
            [member, member.cults.length]
        end
        members_hash = Hash.new{|members_hash, key| members_hash[key] = []}
        members.each{|key, value| members_hash[key]<< value}
        top_ten_hash = members_hash.sort_by{|key, value| value}.reverse.to_h
        top_ten_hash.keys.first(10)
    end
end