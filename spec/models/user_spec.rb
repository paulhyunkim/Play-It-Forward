require 'spec_helper'

describe User do
  describe "nearby" do
  	before do
  		# POINT(longitude latitude)
  		@me = User.create(:coordinates => "POINT(120.3 30.1)")
  		@phoenix = User.create(:coordinates => "POINT(112.0667 33.45)")
  		@new_york = User.create(:coordinates => "POINT(74.0059 40.71)")
  		@san_bernadino = User.create(:coordinates => "POINT(117.3 34.1)")
  	end

  	it "should find only the nearest given quantity of users" do
	  	@me.nearby(2).should include(@san_bernadino)
	  	@me.nearby(2).should include(@phoenix)
	  	@me.nearby(2).should_not include(@new_york)
	  	@me.nearby(2).first.should == @san_bernadino
	  end

    it "should not include self" do
      @me.nearby(2).should include(@san_bernadino)
      @me.nearby(1).should_not include(@me)
    end
	end

  
end