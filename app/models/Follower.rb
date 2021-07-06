class Follower
    attr_reader :name, :age, :life_motto, :cults
    attr_accessor

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

    def self.of_a_certain_age(age)
        Follower.all.select{|follower| follower.age > age}
    end

    def my_cults_slogans
        self.cults.map{|cult| cult.slogan}
    end

    def self.most_active
        mostact = Follower.all.map{|follower| follower.cults.size}.max
        Follower.all.find{|follower| follower.cults.size == mostact}
    end
    
    def cults
        BloodOath.all.select{|oath| oath.follower == self}.map{|oath| oath.cult}
    end

    def join_cult(cult)
        self.age > cult.minimum_age ? BloodOath.new(self, cult) : "Sorry, you are too young to participate this cult."
    end

    def life_motto
        self.life_motto
    end

    def self.top_ten
        Follower.all.sort_by{|follower|
        follower.cults.size}.slice(0,9)
    end

    def fellow_cult_members
        mycults=self.cults
        mycults.map{|cult| cult.followers}.uniq
    end

end