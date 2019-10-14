class BloodOath
    attr_reader :follower, :cult, :date
    @@all = []

    def self.all
        @@all
    end

    def initialize(follower, cult, date = Time.now)
        @follower = follower
        @cult = cult
        @date = date

        @@all << self
    end

    def initiation_date
        t_year = @date.year.to_s
        t_month = @date.month.to_s
        if t_month.length < 2
            t_month = "0" + t_month
        end
        t_day = @date.day.to_s
        if t_day.length < 2
            t_day = "0" + t_day
        end
        p "#{t_year}-#{t_month}-#{t_day}"
    end

    def self.first_oath
        oath_age_array = all.map do |oath|
            oath.date.to_r
        end
        all[oath_age_array.index(oath_age_array.min)]
    end

end