require 'spec_helper'

describe Song do

  before do 
  	@song1 = Song.create(artist: "Zedd", title: "Clarity", duration: 1293, key: "t21223625", album: "null", is_explicit: "null", image_url: "null")
  	@song2 = Song.create(artist: "Katy Perry", title: "Firework", duration: 9384, key:"t16055713", album: "null", is_explicit: "null", image_url:"null")
  	@song3 = Song.create(artist: "Miley Cyrus", title: "We Can't Stop", duration: 231, key:"t37763013", album: "Bangerz", is_explicit: "false", image_url:"null")
	end
	
	it "should have an artist" do 
		expect(@song1.artist).to_not eq(nil)
	end


	it "should have a title" do
		expect(@song1.title).to_not eq(nil)
	end

	it "should have a key" do
		expect(@song1.key).to_not eq(nil)
	end

	it "should have a duration" do
		expect(@song1.duration).to_not eq(nil)
	end

	it "duration should be a positive number" do
		expect(@song1.duration).to be > 0
	end

	






end