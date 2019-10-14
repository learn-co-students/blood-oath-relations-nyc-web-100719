class BloodOath
    attr_reader :cult, :follower
    attr_accessor :start_date
    @@all=[]
    def initialize(cult,follower)
        @cult=cult
        @follower=follower
        @start_date = Time.now
        @@all << self
    end
    def initiation_date
        year= @start_date.year
        month= @start_date.month
        day= @start_date.day
        puts "_#{year}-#{month}-#{day}_"
    end
    def self.first_oath
        sorted=all.sort_by{|bo| bo.start_date}
        return sorted[0]
    end
    def self.all
        @@all
    end

end
