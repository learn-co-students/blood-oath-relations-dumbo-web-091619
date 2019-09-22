class Follower

    attr_accessor :name, :age, :life_motto
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

    def oaths_made
        BloodOath.all.select {|oath| oath.follower == self}.uniq
    end

    def cults
        self.oaths_made.map {|oath| oath.cult}.uniq
    end

    def join_cult(cult)
        if self.age < cult.minimum_age
          return "Sorry, you do not fulfill the age requirement for this cult."
        else
          cult.recruit_follower(self)
        end
    end

    def self.of_a_certain_age(age)
        self.all.select {|follower| follower.age >= age}
    end
    
    def my_cults_slogans
      self.cults.map do |cult|
          cult.slogan
      end
    end
    
    def self.most_active
      count = 0
      cultist = nil
      Follower.all.each do |follower|
        if follower.oaths_made.count > count
          count = follower.oaths_made.count
          cultist = follower 
        end 
      end
      cultist
    end 
    
    def self.top_ten
      follower_hash = {}
      Follower.all.each do |follower|
        follower_hash[follower.name] = follower.oaths_made.count
      end
      sorted = follower_hash.sort_by { |name, count| count }.reverse
      sorted[0..9]
    end 
    
    def fellow_cult_members
      friends = []
      Follower.all.select do |follower|
        intersection = follower.cults & self.cults
        if intersection.empty?
        else
          friends << follower
        end 
      end
      friends.delete(self)
      friends
    end 
    
end
