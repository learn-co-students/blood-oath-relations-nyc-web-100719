require 'pry'
class Cult
    attr_reader :name, :location, :founding_year, :slogan
    @@all=[]
    def initialize(name, location, founding_year, slogan)
        @name=name
        @location=location
        @founding_year=founding_year
        @slogan=slogan
        @@all << self
    end
    def recruit_follower(follower)
        BloodOath.new(self,follower)
    end
    def my_bloods
         BloodOath.all.select do |blood|
            blood.cult==self
         end
    end
    def cult_population
        pop=my_bloods.map do |blood|
            blood.follower
        end
        pop.count
    end
    def followers
        my_bloods.map do |blood|
            blood.follower
        end
    end
    def average_age
        total=0
        followers.each do |follower|
            total+= follower.age
        end
        total/followers.count
    end
    def my_followers_motto
        followers.each do |follower|
            puts follower.life_motto
        end
    end
    def self.most_common_location
        locs=all.map do |cult|
            cult.location
        end
        freq=locs.inject(Hash.new(0)){|h,v| h[v]+=1; h}

        locs.max_by{|x| freq[x]}
    end
    def self.least_popular
        all.min{|c1,c2| c1.followers.count <=> c2.followers.count}

    end
    def self.find_by_founding_year(year)
        all.select do |cult|
            cult.founding_year == year
        end
    end
    def self.find_by_name(name)
        all.select do |cult|
            cult.name == name
        end
    end
    def self.find_by_location(location)
        all.select do |cult|
            cult.location == location
        end
    end

    def self.all
        @@all
    end
end
