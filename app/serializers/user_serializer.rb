class UserSerializer < ActiveModel::Serializer
  attributes :age, :gender, :coordinates, :city, :state
end
