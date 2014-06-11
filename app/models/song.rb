class Song < ActiveRecord::Base
	validates_presence_of :title, :key

  belongs_to :user
  belongs_to :playlist
end
