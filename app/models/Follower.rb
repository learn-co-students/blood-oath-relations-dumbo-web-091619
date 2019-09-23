class Follower

    attr_reader :name, :age, :life_motto

    @@all = []

    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        @@all << self
    end

    def blood_oaths
        BloodOath.all.select do |oath|
            oath.follower == self
        end
    end

    def cults
        blood_oaths.map do |oath|
            oath.cult
        end
    end

    def my_cults_slogans
        cults.map do |cult|
            puts cult.slogan
        end
    end

    def fellow_cult_members
        fellows = []
        Follower.all.each do |follower|
            intersection = follower.cults & self.cults
            if intersection != [] && follower != self
                fellows << follower
            end
        end
        fellows.uniq
    end


    def join_cult(cult)
        if self.age >= cult.minimum_age
            BloodOath.new(cult, self)
        else
            puts "I'm sorry, but you are too young to join this cult."
        end
    end

    def self.all
        @@all
    end

    def self.of_a_certain_age(given_age)
        self.all.select do |follower|
            follower.age >= given_age
        end
    end

    def self.most_active
        most_cults = 0
        most_active_follower = nil
        self.all.each do |follower|
            if follower.cults.length > most_cults
                most_cults = follower.cults.length
                most_active_follower = follower
            end
        end
        most_active_follower
    end

    def self.top_ten
        sorted_followers = self.all.sort do |follower|
            follower.cults.length
        end
        sorted_followers.slice(0..9)
    end


end