class SongSerializer < ActiveModel::Serializer
  attributes :id, :artist, :album, :title, :duration, :key, :is_explicit, :image_url, :user_id, :created_at

  has_one :user
end
