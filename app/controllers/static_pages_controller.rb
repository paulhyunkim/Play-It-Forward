class StaticPagesController < ApplicationController
	# before_action :authenticate_user
	
	def home
		@user = User.new
	end

	def about
	end

	def contact
	end
end
