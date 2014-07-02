require 'spec_helper'

describe UsersController do
	let (:valid_attributes) {{
		:provider => "a",
		:uid => "b",
		:first_name => "c"
		}}

	# trying to login user before running tests
	before do
		@user = User.create! valid_attributes
		session[:user_id] = user.id
		@current_user ||= session[:remember_token] && User.find(session[:remember_token])
	end


	describe 'GET index' do
		before do
			@user1 = User.create! valid_attributes
			@user2 = User.create! valid_attributes
			get :index
		end
		it 'has a 302 status code' do
			expect(response.status).to eq(302)
		end
		# it 'should show all users from assigning @users' do
		# 	expect(assigns(:users)).to include(@user1)
		# 	expect(assigns(:users)).to include(@user2)
		# end

		# should render json
		describe "json format" do
      it "should render the users in json" do
        get :index, :format => :json
        expect(JSON.parse(response.body)).to have(2).objects
      end
    end
	end
end