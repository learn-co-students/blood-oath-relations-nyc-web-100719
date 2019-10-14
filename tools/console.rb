require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

c1 = Cult.new("Crips", "Ramona Park", 1983, "We them crips")
c2 = Cult.new("Bloods", "Magnolia Projects", 1994, "Bicken back bein bool")
f1 = Follower.new("Matt", 25, "Get paid")
f2 = Follower.new("Lettice", 33, "Wyd rn")

bo1 = BloodOath.new(c1, f1)
bo2 = BloodOath.new(c2, f1)

c1.recruit_follower(f2)
c3 = Cult.new("Bama Boys", "Ramona Park", 1994, "Roll Tide")
f3 = Follower.new("Champ", 68, "I love the young people")
c1.recruit_follower(f3)

f4 = Follower.new("Champ", 20, "Cults rule")
f5 = Follower.new("Buddy", 18, "Koolaid")
f6 = Follower.new("Guy", 38, "Where am I")
f7 = Follower.new("Friend", 48, "Who am I")
f8 = Follower.new("Master", 58, "I need a cult")
f9 = Follower.new("Cult Dude", 102, "Hydration is key")
f10 = Follower.new("Prince", 7, "MAGA")
f11 = Follower.new("Bozo", 3, "I am the one who knocks")
f12 = Follower.new("Dat Boi", 50, "Cult king")

c4 = Cult.new("The Cult", "Magnolia Projects", 2019, "Only join this cult")
c5 = Cult.new("The Kidz Club", "Magnolia Projects", 1976, "No adults allowed")
c6 = Cult.new("Jungle Gym Gangsters", "Magnolia Projects", 1994, "We also hate adults")
c7 = Cult.new("Star Wars Fans", "Tatooine", 2324, "We hate The Last Jedi")
c8 = Cult.new("Norwegians", "Norway", 1994, "Hinga dinga dergen")
c9 = Cult.new("Nerf Nerds", "Norway", 1999, "It's nerf or nothin' ")
c10 = Cult.new("The Neutrals", "Planet Neutral", 2000, "We have no strong feelings one way or the other")

c3.recruit_follower(f1)
c4.recruit_follower(f1)
c5.recruit_follower(f1)
c6.recruit_follower(f1)
c7.recruit_follower(f1)
c8.recruit_follower(f1)
c9.recruit_follower(f1)
c10.recruit_follower(f1)

c3.recruit_follower(f8)
c4.recruit_follower(f8)
c5.recruit_follower(f8)
c6.recruit_follower(f8)
c7.recruit_follower(f8)
c8.recruit_follower(f8)
c9.recruit_follower(f8)

c3.recruit_follower(f9)
c4.recruit_follower(f9)
c5.recruit_follower(f9)
c6.recruit_follower(f9)
c7.recruit_follower(f9)
c8.recruit_follower(f9)
c9.recruit_follower(f9)

c3.recruit_follower(f4)
c4.recruit_follower(f4)
c5.recruit_follower(f4)
c6.recruit_follower(f4)
c7.recruit_follower(f4)

c3.recruit_follower(f9)
c4.recruit_follower(f9)
c5.recruit_follower(f9)
c6.recruit_follower(f9)
c7.recruit_follower(f9)

c3.recruit_follower(f5)
c4.recruit_follower(f5)
c5.recruit_follower(f5)
c6.recruit_follower(f5)
c7.recruit_follower(f5)

c1.recruit_follower(f7)
c2.recruit_follower(f7)
c3.recruit_follower(f7)
c4.recruit_follower(f7)

f12.join_cult(c1)
f12.join_cult(c9)
f12.join_cult(c10)

f11.join_cult(c1)
f11.join_cult(c9)
f11.join_cult(c10)

BloodOath.new(f2, c7)
BloodOath.new(f2, c5)

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
