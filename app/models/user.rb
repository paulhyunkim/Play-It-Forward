class User < ActiveRecord::Base
	has_many :playlists
	has_many :songs
	has_one :location
end
