class SessionsController < ApplicationController

	def new
	end

	def create
		p "hello"
		auth = request.env["omniauth.auth"]
		p auth["provider"]
		p auth["uid"]
		user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
		session[:user_id] = user.id
		redirect_to root_url, :notice => "Signed in!"
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url, :notice => "Signed out!"
	end





	# def create
	# 	@user = User.where(:username => params[:session][:username]).first

	# 	if @user == nil || !@user.authenticate(params[:session][:password])
	# 		flash.now[:error] = "Invalid email and password combination!"
	# 		render 'new'
	# 	else
	# 		session[:remember_token] = @user.id
	# 		@current_user = @user
	# 		flash.now[:success] = "You have LOGGED IN successfully!"
	# 		redirect_to users_path
	# 	end
	# # end	

	# def destroy
	# 	session.delete(:remember_token)
	# 	redirect_to root_path
	# end
end

