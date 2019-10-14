require 'pry'
class Follower
    attr_reader :name, :age, :life_motto
    @@all=[]
    def initialize(name,age,life_motto)
        @name=name
        @age=age
        @life_motto=life_motto
        @@all << self
    end
    def bloods
        BloodOath.all.select do |blood|
            blood.follower==self
        end
    end
    def cults
        bloods.map do |blood|
            blood.cult
        end
    end
    def my_cults_slogans
        cults.each do |cult|
            puts cult.slogan
        end
    end
    def join_cult(cult)
        BloodOath.new(cult,self)
    end
    def fellow_cult_members
        members=cults.map do |cult|
            cult.followers
        end
        members
    end
    def self.most_active
        bloods = BloodOath.all
        followers=bloods.map do |blood|
            blood.follower
        end
        freq=followers.inject(Hash.new(0)){|h,v| h[v]+=1; h}
        followers.max_by{|x| freq[x]}
    end
    def self.top_ten
        bloods = BloodOath.all
        followers=bloods.map do |blood|
            blood.follower
        end
        freq=followers.inject(Hash.new(0)){|h,v| h[v]+=1; h}
        top10=freq.sort_by{|k,v| -v}
        top10.map do |arr|
            arr[0]
        end
    end
    def self.of_a_certain_age(age)
        all.select do |follower|
            follower.age == age
        end
    end
    def self.all
        @@all
    end

end
