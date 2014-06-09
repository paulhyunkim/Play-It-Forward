# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create(lat: "-74.0059", lng: "40.7127", city: "New York City", state: "New York", coordinates: "POINT(40.7127 -74.0059)")
User.create(lat: "36.246369", lng: "-115.251890", city: "Las Vegas", state: "Nevada", coordinates: "POINT(-115.251890 36.246369)")
User.create(lat: "47.603043", lng: "-122.334469", city: "Seattle", state: "Washington", coordinates: "POINT(-122.334469 47.603043)")
User.create(lat: "41.928214", lng: "-87.688888", city: "Chicago", state: "Illinois", coordinates: "POINT(-87.688888 41.928214)")

Song.create(artist: "Zedd", key: "t21223625", user_id: 1, title: "Clarity")
Song.create(artist: "Katy Perry", key: "t16055713", user_id: 2, title: "Firework")
Song.create(artist: "Lionel Richie", key: "t2841831", user_id: 3, title: "Hello")
Song.create(artist: "Kid Ink feat. Chris Brown", key: "t36248476", user_id: 4, title: "Show Me")