require 'spec_helper'

describe StaticPagesController, type: :controller do

	describe "GET index" do
	 	it "should succeed" do
      get :home
      expect(response).to be_success
    end

  end

end
