require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

c1 = Cult.new("Scientology", "Florida", 1953, "Come meet Tom Cruise!")
c2 = Cult.new("Manson Family", "LA, California", 1960, "Please drink the Kool-aid!")
c3= Cult.new("Heaven's Gate", "LA, California", 1974, "Aliens are real")

f1= Follower.new("Tom Cruise", 57, "I'm 5'9!!!!!")
f2= Follower.new("Danny Masterson", 43, "I was on that 70's show")
f3= Follower.new("Charles Manson", 83, "Everybody's crazy")
f4 = Follower.new("Candy Stevens", 81, "Come and get it")
f5= Follower.new("Generic Cult Member", 23, "I'm just happy to be here")
f6= Follower.new("Marshall Applewhite", 70, "I'm running out of life motto ideas")
f7= Follower.new("Bonnie Nettles",69, "motto")


b1 = BloodOath.new(c1,f1)
b2 = BloodOath.new(c1,f2)
b3 = BloodOath.new(c2,f3)
b4 = BloodOath.new(c2,f4)
b5= BloodOath.new(c1,f5)
b6= BloodOath.new(c3,f6)
b7= BloodOath.new(c3,f7)
b9= BloodOath.new(c2,f5)
b10= BloodOath.new(c3,f5)

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
