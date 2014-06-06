class CurrentuserController < ApplicationController
	before_action :authenticate_user, :except => [:new, :create]
	respond_to :json, :html
	def index
		respond_with current_user
	end

	def create
		@user = User.new(user_params)
		if @user.save
			# session[:remember_token] = @user.id
			# @current_user = @user
			# session[:remember_token] = @user.id.to_s
			flash.now[:success] = "You have succesfully signed up!"
			redirect_to users_path
		else
			render 'new'
		end
		respond_with @user
	end

	def update
		p "hello"
	end

	protected

	def user_params
		params.require(:user).permit(:username, :email, :age, :gender, :password, :password_confirmation, :city, :state, :coordinates)
	end
end
