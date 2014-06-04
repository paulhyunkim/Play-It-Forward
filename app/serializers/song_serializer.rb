class SongSerializer < ActiveModel::Serializer
  attributes :id, :artist, :album, :title, :duration, :key, :is_explicit, :image_url
end
