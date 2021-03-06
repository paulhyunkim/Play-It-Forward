require "bcrypt"
require "omniauth"
require "omniauth-rdio"

class User < ActiveRecord::Base
	include ActiveModel::SecurePassword
	# before_save { self.email = email.downcase }
	# before_save { self.first_name = first_name.downcase }
	# validates :first_name, :password, :password_confirmation, presence: true, on: :create
	# validates :email, uniqueness: true
	# validates :first_name, length: { in: 4..15 } 
	# # #before_save downcase username & email
	# validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
	# # validates :age,  numericality: { only_integer: true, greater_than: 13, less_than: 120 }
	# has_secure_password
	# validates :password, length: { minimum: 8 }, on: :create

	has_many :playlists
	has_many :songs

	def range
    %{ %s / %s AS range} % [distance_to_point, METERS_IN_A_MILE]
  end

	def distance_to_point
  	%{
    		ST_Distance(users.coordinates, ST_GeographyFromText('SRID=4326;%s'))
  	} % self.coordinates
	end

	def nearby(quantity)
		User.select("*").select(range).where("id != ?", self.id).order("range ASC").limit(quantity)
	end
	# can call .range on returned users to see distance to user

	def self.search(query)
	  where("email like ?", "%#{query}%") 
	end

	def self.create_with_omniauth(auth)
	  create! do |user|
	    user.provider = auth["provider"]
	    user.uid = auth["uid"]
	    user.first_name = auth["info"]["first_name"]
	    user.last_name = auth["info"]["last_name"]
	    # user.gender = auth["raw_info"]["gender"]
		end
	end

	def self.find_by_provider_and_uid(provider, uid)
	  where(provider: provider, uid: uid).first
	end





end