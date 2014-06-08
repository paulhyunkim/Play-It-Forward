class UserSerializer < ActiveModel::Serializer
  attributes :first_name, :last_name, :age, :gender, :coordinates, :city, :state, :lat, :lng
end