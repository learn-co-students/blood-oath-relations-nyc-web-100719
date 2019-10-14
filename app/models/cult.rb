class Cult
    @@all = [] 

    attr_reader :name, :location, :founding_year, :slogan

    def initialize(name, location, founding_year, slogan)
        @name = name
        @location = location 
        @founding_year = founding_year
        @slogan = slogan
        @@all << self
    end

    def self.all
        return @@all
    end

    def self.find_by_name(name)
        @@all.find do |cult|
            cult.name == name
        end
    end

    def self.find_by_location(location)
        @@all.select do |cult|
            cult.location == location
        end
    end

    def self.find_by_founding_year(year)
        @@all.select do |cult|
            cult.founding_year == year
        end
    end

    def self.least_popular 
        sorted_cults = all.sort{|a, b| a.cult_population <=> b.cult_population}
        return sorted_cults[0]
    end

    def self.most_common_location
        all_locations = @@all.map do |cult|
            cult.location
        end

        return all_locations.max_by {|location| all_locations.count(location)}
    end

    def recruit_follower(follower)
        BloodOath.new(self, follower)
    end
    
    def my_bloodoaths
        BloodOath.all.select do |bloodoath|
            bloodoath.cult == self
        end
    end

    def my_followers
        my_bloodoaths.map do |bloodoath|
            bloodoath.follower
        end
    end

    def my_followers_mottos
        my_followers.each do |follower|
            follower.life_motto
        end
    end
    
    def cult_population
        return my_followers.count
    end

    def average_age
        all_ages = my_followers.map do |follower|
            follower.age.to_f
        end

        total = all_ages.reduce(:+)

        return total / my_followers.count.to_f
    end
end