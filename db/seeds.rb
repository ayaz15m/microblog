User.destroy_all
Relationship.destroy_all
Message.destroy_all
Login.destroy_all


ayaz = User.create name: "Ayaz Merchant", location: "Houston, TX", pic: "http://1.bp.blogspot.com/-rRuEUw7ZUKc/TuKEF4yxmUI/AAAAAAAAAuI/rW785s_mGBs/s1600/worm-hole-space-art-1-x1gqjmibsb-1280x1024.jpg"
spongebob = User.create name: "Spongebob Squarepants", location: "Dallas, TX", pic: "http://images6.fanpop.com/image/photos/33100000/Spongebob-Wallpaper-spongebob-squarepants-33184550-1024-768.jpg"
sandy = User.create name: "Sandy Squirrel", location: "Fort Worth, TX", pic: "http://www.heisingart.com/Mammals/otters/SeaOttersMLFam_024w.jpg"
patrick = User.create name: "Patrick Conehead", location: "San Antonio, TX", pic: "http://th02.deviantart.net/fs71/PRE/f/2013/038/4/0/patrick_star_rainmeter_skin_by_no121else-d5u56i2.png"
kramer = User.create name: "Cosmo Kramer", location: "Austin, TX", pic: "http://download.4-designer.com/files/20130110/Figure-cartoon-image-psd-layered-material-46287.jpg"
greg = User.create name: "Greg Jacobs", location: "Galveston, TX", pic: "http://www.aperfectworld.org/clipart/cartoons/tourist.png"
adam = User.create name: "Adam Jones", location: "College Station, TX", pic: "http://0.tqn.com/d/rock/1/0/D/5/-/-/simp_HomerSingle08_f.jpg"



Login.create email: "ayaz@1.com", name: "Ayaz Merchant", password: "ayazayaz"
Login.create email: "bob@1.com", name: "Spongebob Squarepants", password: "bobbobbob"
Login.create email: "sarah@1.com", name: "Sandy Squirrel", password: "sandysandy"
Login.create email: "kramer@1.com", name: "Patrick Conehead", password: "patrickpatrick"
Login.create email: "liz@1.com", name: "Cosmo Kramer", password: "kramerkramer"
Login.create email: "greg@1.com", name: "Greg Jacobs", password: "greggreg"
Login.create email: "adam@1.com", name: "Adam Jones", password: "adamadam"



Relationship.create user: spongebob, follower: ayaz.id
Relationship.create user: sandy, follower: ayaz.id
Relationship.create user: kramer, follower: ayaz.id


Relationship.create user: kramer, follower: patrick.id
Relationship.create user: sandy, follower: greg.id
Relationship.create user: ayaz, follower: spongebob.id
Relationship.create user: ayaz, follower: sandy.id
Relationship.create user: ayaz, follower: kramer.id
Relationship.create user: ayaz, follower: patrick.id
Relationship.create user: ayaz, follower: greg.id
Relationship.create user: ayaz, follower: adam.id


Message.create user: ayaz, message: "Ayaz's 1st Message"
Message.create user: spongebob, message: "Spongebob's 1st Message"
Message.create user: sandy, message: "Sandy's 1st Message"
Message.create user: kramer, message: "Kramer's 1st Message"
Message.create user: patrick, message: "Patricks's 1st Message"
Message.create user: greg, message: "Greg's 1st Message"
Message.create user: adam, message: "Adam's 1st Message"
