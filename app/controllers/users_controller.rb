

class UsersController < ApplicationController

	def index
		client = RdioApi.new(:consumer_key => "px6jnus8n8e94qg7u9fbhpsc", :consumer_secret => "qJzVAj7PxJ")
	  if params[:search]
	    @songs = client.search(:query => params[:search], :types => "track", count: 10).results
	  else
	    @songs = []
	  end
	end

	def show
		@uri = "spotify:track:1ZA8L9IOkRhmmz4nPXXx7h"
	end


	def new
		@user = User.new
	end

	

	def show
		@uri = "spotify:track:1ZA8L9IOkRhmmz4nPXXx7h"
	end

	def create
		@user = User.new(user_params)
		if @user.save
			# session[:remember_token] = @user.id
			# @current_user = @user
			# flash.now[:success] = "You have succesfully signed up!"
			redirect_to new_sessions_path
		else
			render 'new'
		end
	end

	def update
		@user = User.find(params[:id])
	end

protected

	def user_params
		params.require(:user).permit(:username, :email, :age, :gender, :password, :password_confirmation, :city, :state, :coordinates)
	end
end
