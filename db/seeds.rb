# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.destroy_all
Relationship.destroy_all
Message.destroy_all


ayaz = User.create name: "Ayaz", location: "Houston, TX", pic: "http://shutupdad.files.wordpress.com/2012/07/ww.jpg"
bob = User.create name: "Bob", location: "Dallas, TX", pic: "http://images2.fanpop.com/image/photos/13500000/Brushing-Teeth-spongebob-squarepants-13515969-1280-1024.jpg"
sarah = User.create name: "Sarah", location: "Fort Worth, TX", pic: "http://www.heisingart.com/Mammals/otters/SeaOttersMLFam_024w.jpg"
kramer = User.create name: "Kramer", location: "San Antonio, TX", pic: "http://th02.deviantart.net/fs71/PRE/f/2013/038/4/0/patrick_star_rainmeter_skin_by_no121else-d5u56i2.png"
liz = User.create name: "Liz", location: "Austin, TX", pic: "http://download.4-designer.com/files/20130110/Figure-cartoon-image-psd-layered-material-46287.jpg"
greg = User.create name: "Greg", location: "Galveston, TX", pic: "http://www.aperfectworld.org/clipart/cartoons/tourist.png"
adam = User.create name: "Adam", location: "College Station, TX", pic: "http://0.tqn.com/d/rock/1/0/D/5/-/-/simp_HomerSingle08_f.jpg"



Relationship.create user: bob, follower: ayaz.id
Relationship.create user: sarah, follower: ayaz.id
Relationship.create user: kramer, follower: ayaz.id


Relationship.create user: kramer, follower: liz.id
Relationship.create user: sarah, follower: greg.id
Relationship.create user: ayaz, follower: bob.id


Message.create user: ayaz, message: "Ayaz's Message"
Message.create user: bob, message: "Bob's Message"
Message.create user: sarah, message: "Sarah's Message"
Message.create user: kramer, message: "Kramer's Message"
Message.create user: liz, message: "Liz's Message"
Message.create user: greg, message: "Greg's Message"
