require "bcrypt"

class User < ActiveRecord::Base
	include ActiveModel::SecurePassword

	validates :username, :email, :password, :password_confirmation, :age, :gender, presence: true
	validates :username, :email, uniqueness: true
	validates :username, length: { in: 4..15 } 
	#before_save downcase username & email
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
	validates :age,  numericality: { only_integer: true, greater_than: 13, less_than: 120 }

	has_secure_password
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


end
