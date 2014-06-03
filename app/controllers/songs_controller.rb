class SongsController < ApplicationController
	before_action :set_song, :only => [:show, :edit, :update, :destroy]

	respond_to :html, :json

	def index
	    @songs = Song.all
	    respond_with @songs
    end

	def new
		@song = Song.new
	end

	def show
    	respond_with @song
  	end

	def search(search_term)
		@results = MetaSpotify::Track.search(search_term)
	end


	def create
		@song = Song.new(song_params)
		if @song.save
			respond_to do |format|
			 format.html {redirect_to users_path}
			 format.json {render json: @song, status: :created}
			 flash[:success] = "You have added a song to your playlist."
			end
		else
		
		respond_to do |format|
			 format.html {render 'new'}
			 format.json { render json: @song.errors, status: :unprocessable_entity}	
		   	 flash[:error] = "Could not add song to your playlist. Try again."
			 redirect_to new_user_path
		    end
		end
	end

	private

 	 def set_song
   		 @song = Song.find(params[:id])
  	end

	def song_params
		params.require(:song).permit(:title, :artist, :album, :duration, :popularity, :href)
	end

end
