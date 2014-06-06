class SongsController < ApplicationController
	before_action :set_song, :only => [:edit, :update, :destroy]
	before_action :authenticate_user
	respond_to :html, :json

	def index
    # @nearby_users = current_user.nearby(5)
    # @songs = Song.where(:user_id => @nearby_users.map(&:id))
    @current_user_songs = current_user.songs.all
    # @songs = Song.all
    @songs = current_user.songs.all
    respond_with(@songs)
  end

	def new
		@song = current_user.songs.new
	end

	def all
		@songs = Song.all
		respond_with(@songs)
	end

	def show
		@songs = Song.all
		respond_with(@songs)
	end

	def create
		@song = current_user.songs.new(song_params)
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

	def destroy

    @song.destroy

    respond_to do |format|
      format.html { redirect_to songs_path }
      format.json { render json: { head: :ok } }
    end
  end

  def update
  	p "hello"
  end

	private

 	def set_song
   		 @song = Song.find(params[:id])
  	end

	def song_params
		params.require(:song).permit(:title, :artist, :album, :duration, :is_explicit, :key, :image_url)
	end

end
