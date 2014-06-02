class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :artist
      t.string :title
      t.float :duration
      t.float :popularity
      t.string :href
      t.string :album
      t.references :user, index: true
      t.references :playlist, index: true

      t.timestamps
    end
  end
end
