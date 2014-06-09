# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(lat: "74.0059", lng: "40.7127", city: "New York City", coordinates: "POINT(40.7127 74.0059)")
User.create(lat: "35.6895", lng: "139.6917", city: "Tokyo", coordinates: "POINT(139.6917 35.6895)")
User.create(lat: "31.2000", lng: "121.5000", city: "Shanghai", coordinates: "POINT(121.5000 31.2000)")
User.create(lat: "48.8567", lng: "2.3508", city: "Paris", coordinates: "POINT(2.3508 48.8567)")
Song.create(artist: "Zedd", key: "t21223625", user_id: 1, title: "Clarity")
Song.create(artist: "Katy Perry", key: "t16055713", user_id: 2, title: "Firework")
Song.create(artist: "Lionel Richie", key: "t2841831", user_id: 3, title: "Hello")
Song.create(artist: "Kid Ink feat. Chris Brown", key: "t36248476", user_id: 4, title: "Show Me")