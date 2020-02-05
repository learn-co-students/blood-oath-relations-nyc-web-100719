require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

c1 = Cult.new("The Manson Family", "Los Angeles, CA", 1969, "When you're here, you're family.")
c2 = Cult.new("Heaven's Gate", "San Diego, CA", 1995, "Heaven's not for everyone.", 35)
c3 = Cult.new("BLAH", "Los Angeles, CA", 2019, "BLAHBLAH")

f1 = Follower.new("Tom Cruise", 50, "I'm 5'9\"!!!")
f2 = Follower.new("Jane Fonda", 72, "Let's workout.")
f3 = Follower.new("Jane the Virgin", 30, "This is what happens when you crumple your flower.")
f4 = Follower.new("Jennifer Lopez", 48, "I'm still young!")

c1.recruit_follower(f1)
sleep(1)
c1.recruit_follower(f2)
c2.recruit_follower(f3)
sleep(1)
c2.recruit_follower(f4)

f2.join_cult(c2)

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
