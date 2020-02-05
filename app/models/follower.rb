class Follower
    attr_reader :name, :age, :life_motto
    @@all = []

    def self.all
        @@all
    end

    def self.of_a_certain_age(age)
        all.select do |follower|
            follower.age >= age
        end
    end

    def self.activity_hash
        followers = BloodOath.all.map do |oath|
            oath.follower
        end
        freq = followers.inject(Hash.new(0)) do |h,v|
            h[v] += 1; h
        end
    end

    def self.most_active
        freq = activity_hash
        freq.max_by { |loc| loc[1] }.first
    end

    def self.top_ten
        freq = activity_hash
        x = freq.sort_by { |loc| -loc[1] }.to_h
        x.keys[0..9]
    end

    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto

        @@all << self
    end

    def oaths
        BloodOath.all.select do |oath|
            oath.follower == self
        end
    end

    def cults
        oaths.map do |oath|
            oath.cult
        end
    end

    def join_cult(cult)
        if self.age >= cult.minimum_age
            BloodOath.new(self, cult)
        else
            puts "Unfortunately, you are too young to join #{cult.name}. Try again later or join a different cult."
        end
    end

    def my_cults_slogans
        cult_slogans = cults.map do |cult|
            cult.slogan
        end
        cult_slogans.each do |slogan|
            puts slogan
        end
        return nil
    end

    def fellow_cult_members
        all_my_cult_followers = cults.map do |cult|
            cult.followers
        end
        all_my_cult_followers.flatten!
        all_my_cult_followers.reject! do |follower|
            # binding.pry
            follower == self
        end
        all_my_cult_followers
    end

end