class UsersController < ApplicationController
	before_action :authenticate_user, :except => [:new, :create]
	respond_to :json, :html

	
	
	def index
		@users = User.all
		respond_with @users
	 
	end

	def show
		@user = User.find(params[:id])
		respond_with @user
	end


	def new
		@user = User.new
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
	
		end
	end

	def destroy
		session.delete(:remember_token)
		redirect_to root_path
	end

	def update
		@user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path
    else
      render 'edit'
    end
	end

protected

	def user_params
		params.require(:user).permit(:username, :email, :age, :gender, :password, :password_confirmation, :city, :state, :coordinates, :lng, :lat)
	end
end
