require 'spec_helper'

describe SongsController do

	before do
		@dinna = Song.create(flavor: "Plain", topping: "Mochi", quantity: "11")
		@paul = Song.create(flavor: "Chocolate", topping: "Blueberries", quantity: "8.5")
		@aaron = Song.create(flavor:"Peanut Butter", topping: "Wafer", quantity: "12")
	end

	describe "GET index" do
		
		it "should render the index view" do
			get :index
			expect(response).to render_template :index
		end

		it "assigns @yogurts" do
			get :index
			expect(assigns(:yogurts)).to include(@dinna)
			expect(assigns(:yogurts)).to include(@paul)
			expect(assigns(:yogurts)).to include(@aaron)
			expect(assigns(:yogurts)).to_not include(@hannah)		
		end

	end

	describe "GET show" do

		it "should render the show view" do
			get :show, id: @dinna.id
			expect(response).to render_template :show
		end

		it "assigns @yogurt to dinna's yogurt" do
			get :show, id: @dinna.id
			expect(assigns(:yogurt)).to include(@dinna)
			expect(assigns(:yogurt)).to_not include(@paul)
			
		end

	end

end
