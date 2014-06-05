class CurrentuserController < ApplicationController
	before_action :authenticate_user, :except => [:new, :create]
	respond_to :json, :html
	def index
		respond_with current_user
	end
end
