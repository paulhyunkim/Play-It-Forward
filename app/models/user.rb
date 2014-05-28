class User < ActiveRecord::Base
	has_many :playlists
	has_many :songs

	def range
    %{ %s / %s AS range} % [distance_to_point, METERS_IN_A_MILE]
  end

  def distance_to_point
    %{
      ST_Distance(users.coordinates, ST_GeographyFromText('SRID=4326;%s'))
    } % self.coordinates
  end

	def nearby(quantity)
		User.select("*").select(range).where("id != ?", self.id).order("range ASC").limit(quantity)
	end
	# can call .range on returned users to see distance to user

end
