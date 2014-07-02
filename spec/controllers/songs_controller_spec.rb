# require 'spec_helper'

# describe SongsController do

# 	before do
# 		@songA = Song.create(artist: "Zedd", key: "t21223625", user_id: 1, title: "Clarity")
# 		@songB = Song.create(artist: "Katy Perry", key: "t16055713", user_id: 2, title: "Firework")
# 		@songC = Song.create(artist: "Lionel Richie", key: "t2841831", user_id: 3, title: "Hello")
# 		@songD = Song.create(artist: "Kid Ink feat. Chris Brown", key: "t36248476", user_id: 4, title: "Show Me")
# 	end

# 	describe "GET index" do
		
# 		it "should render the index view" do
# 			get :index
# 			expect(response).to render_template :index
# 		end

# 		it "assigns @yogurts" do
# 			get :index
# 			expect(assigns(:yogurts)).to include(@dinna)
# 			expect(assigns(:yogurts)).to include(@paul)
# 			expect(assigns(:yogurts)).to include(@aaron)
# 			expect(assigns(:yogurts)).to_not include(@hannah)		
# 		end

# 	end

# 	describe "GET show" do

# 		it "should render the show view" do
# 			get :show, id: @dinna.id
# 			expect(response).to render_template :show
# 		end

# 		it "assigns @yogurt to dinna's yogurt" do
# 			get :show, id: @dinna.id
# 			expect(assigns(:yogurt)).to include(@dinna)
# 			expect(assigns(:yogurt)).to_not include(@paul)
			
# 		end

# 	end

# end
