class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :artist
      t.string :title
      t.integer :duration
      t.string :key
      t.string :album
      t.boolean :is_explicit
      t.string :image_url
      t.references :user, index: true
      t.references :playlist, index: true

      t.timestamps
    end
  end
end
