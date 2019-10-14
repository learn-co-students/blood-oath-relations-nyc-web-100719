class Follower 
    @@all = []

    attr_reader :name, :age, :life_motto

    def initialize(name, age, life_motto)
        @name = name
        @age = age 
        @life_motto = life_motto
        @@all << self
    end

    def self.all 
        return @@all
    end

    def self.of_a_certain_age(age)
        @@all.select do |follower|
            follower.age >= age
        end
    end

    def self.top_ten 
        sorted_followers = @@all.sort do |a, b|
            b.my_cults.count <=> a.my_cults.count 
        end

        return sorted_followers[0..9]
    end

    def join_cult(cult)
        BloodOath.new(cult, self)
    end

    def my_bloodoaths
        BloodOath.all.select do |bloodoath|
            bloodoath.follower == self
        end
    end

    def my_cults
        my_bloodoaths.map do |bloodoath|
            bloodoath.cult
        end
    end

    def my_cults_slogans 
        my_cults.map do |cult|
            cult.slogan 
        end
    end
end