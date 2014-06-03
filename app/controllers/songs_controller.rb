class SongsController < ApplicationController

	def new
		@song = Song.new
	end

	def search(search_term)
		@results = MetaSpotify::Track.search(search_term)
	end


	def create
		@song = Song.new(song_params)
		if @song.save
			flash[:success] = "You have added a song to your playlist."
			redirect_to users_path
		else
			flash[:error] = "Could not add song to your playlist. Try again."
			redirect_to new_user_path
		end

		
	end

	private

	def song_params
		params.require(:song).permit(:title, :artist, :album, :duration, :popularity, :href)
	end

end
