class UsersController < ApplicationController

	def index
	  if params[:search]
	    @songs = MetaSpotify::Track.search(params[:search])[:tracks][0,10]
	  else
	    @songs = MetaSpotify::Track.search("bump n grind")[:tracks][0,10]
	  end
	end

	def show
		@uri = "spotify:track:1ZA8L9IOkRhmmz4nPXXx7h"
	end

end
