class UsersController < ApplicationController



	def index
			@uri = "spotify:artist:4phGZZrJZRo4ElhRtViYdl"
			@users = Users.all
	end


	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
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
