class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :age
      t.string :gender
      t.string :password_digest

      t.string :city
      t.string :state
      t.string :lat
      t.string :lng

      t.point :coordinates, :geographic => true

      t.timestamps
    end
  end
end