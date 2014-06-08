class UserSerializer < ActiveModel::Serializer
  attributes :username, :age, :gender, :coordinates, :city, :state, :lat, :lng
end
