class BloodOath 
    @@all = []
    
    attr_reader :initiation_date, :cult, :follower

    def initialize(cult, follower)
        @initiation_date = "#{Time.now.year}-#{Time.now.month}-#{Time.now.day}"
        @cult = cult
        @follower = follower
        @@all << self
    end

    def self.all 
        return @@all
    end

    def self.first_oath 
        return @@all[0].follower
    end
end