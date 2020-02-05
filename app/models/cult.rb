class Cult
    attr_reader :name, :location, :founding_year, :slogan
    attr_accessor :minimum_age
    @@all = []

    def self.all
        @@all
    end

    def self.find_by_name(name)
        name_array = all.map do |cult|
            cult.name
        end
        if name_array.find_index(name)
            all[name_array.find_index(name)]
        end
    end

    def self.find_by_location(location)
        location_array = all.map do |cult|
            cult.location
        end
        if location_array.find_index(location)
            all[location_array.find_index(location)]
        end
    end

    def self.find_by_founding_year(year)
        year_array = all.map do |cult|
            cult.founding_year
        end
        if year_array.find_index(year)
            all[year_array.find_index(year)]
        end
    end

    def self.least_popular
        popularity_array = all.map do |cult|
            cult.cult_population
        end
        all[popularity_array.index(popularity_array.min)]
    end

    def self.most_common_location
        location_array = all.map do |cult|
            cult.location
        end
        freq = location_array.inject(Hash.new(0)) do |h,v|
            #binding.pry
            h[v] += 1; h
        end
        freq.max_by { |loc| loc[1] }.first
    end

    def initialize(name, location, founding_year, slogan, minimum_age = 18)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @minimum_age = minimum_age

        @@all << self
    end

    def recruit_follower(follower)
        if follower.age >= self.minimum_age
            BloodOath.new(follower, self)
        else
            puts "Unfortunately, #{follower.name} is too young to join your cult."
        end
    end

    def oaths
        BloodOath.all.select do |oath|
            oath.cult == self
        end
    end

    def cult_population
        oaths.length
    end

    def average_age
        age_array = oaths.map do |oath|
            oath.follower.age
        end
        age_array.sum.to_f / age_array.length.to_f
    end

    def my_followers_mottos
        oaths.map do |oath|
            oath.follower.life_motto
        end
    end

    def followers
        follower_array = oaths.map do |oath|
            oath.follower
        end
        follower_array.uniq!
        follower_array
    end

end