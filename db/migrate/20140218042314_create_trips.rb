class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :name
    	t.datetime :date
    	t.string :vessel
    	t.string :captain
    	t.integer :rating
    	t.text :comments
    	t.integer :location_id
      t.integer :user_id

      t.timestamps
    end
  end
end
