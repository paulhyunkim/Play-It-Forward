class SessionsController < ApplicationController

	def new
	end

	def create
		@user = User.where(:username => params[:session][:username]).first

		if @user == nil || !@user.authenticate(params[:session][:password])
			flash.now[:error] = "Invalid email and password combination!"
			render 'new'
		else
			session[:remember_token] = @user.id
			@current_user = @user
			flash.now[:success] = "You have LOGGED IN successfully!"
			redirect_to users_path
		end
	end	

	def destroy
		session.delete(:remember_token)
		redirect_to root_path
	end
end

