class CurrentusersController < ApplicationController
	before_action :authenticate_user, :except => [:new, :create, :update]
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

	def show
		respond_with current_user
	end
 

	def update
		@user = User.last
	  if @user.update(user_params)
      respond_to do |format|
        format.html { render 'edit' }
        format.json { render nothing: true, status: :no_content }
      end
    else
    	p "failed to save"
      respond_to do |format|
        format.html { render 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

   
	end

	protected

	def user_params
		params.require(:currentuser).permit(:coordinates, :lat, :lng)
	end
end
