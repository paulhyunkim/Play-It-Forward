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

  describe "validations" do
    it "should not create a user with a first_name longer than 15 characters" do
      long_name = "a" * 51
      long_name_user = User.new(:first_name => long_name)
      long_name_user.should_not be_valid
    end
    it "should not create a user without a password and password confirmation" do
      @me = User.new(first_name: "User User", password: "12345668", password_confirmation: "")
      @me.should_not be_valid
    end
    it "should not accept a password shorter than 8 characters" do
      @me = User.new(first_name: "User User", password: "1234", password_confirmation: "1234")
      @me.should_not be_valid
    end
    it "should downcase user's email upon save" do
      @me = User.create(first_name: "User User", email: "USER@USER.COM", password: "12345678", password_confirmation: "12345678")
      expect(@me.email).to eq("user@user.com")
    end
    it "should not create a user that has en incorrect email format" do
      @me = User.create(first_name: "User User", email: "user@usercom", password: "12345678", password_confirmation: "12345678")
      @me.should_not be_valid
    end

    it "should not create a user with a duplicate email" do
      @me = User.create(first_name: "User User", email: "user@user.com", password: "12345678", password_confirmation: "12345678")
      @me2 = User.create(first_name: "He User", email: "user@user.com", password: "22345678", password_confirmation: "22345678")
      @me.should be_valid
      @me2.should_not be_valid
    end
  end

  describe "omniauth" do

    before do 
      auth = {
        "provider" => "rdio",
        "uid" => "123",
        "info" => {
          "first_name" => "John",
          "last_name" => "Doe"
        }
      }
      @me = User.create_with_omniauth(auth)
    end


    it "should create a user using the create_with_omniauth method" do
      @me.should be_valid
    end

    it "should find_by_provider_and_uid(provider, uid)" do
      @user = User.find_by_provider_and_uid("rdio", "123")
      expect(@user).to eq(@me)
    end
  end



  
end