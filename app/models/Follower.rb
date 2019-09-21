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

  def blood_oaths
    BloodOath.all.select do |bloodOath|
      bloodOath.follower == self
    end
  end

  def cults 
    self.blood_oaths.map(&:cult)
  end

  def join_cult(cult)
    BloodOath.new(cult, self,Time.now.strftime("%m/%d/%Y"))
  end

  def self.of_a_certain_age(age)
    self.all.select do |follower|
      follower.age >= age 
    end
  end

  def my_cults_slogans
    self.cults.map(&:slogan)
  end

  def self.most_active
    self.all.max do |follower_a, follower_b| 
      follower_a.cults.count <=> follower_b.cults.count
    end
  end

  def self.top_ten
    top_sorted = self.all.sort_by do |follower|
      follower.cults.count
    end
    top_sorted.reverse.slice(0,9)
  end

end