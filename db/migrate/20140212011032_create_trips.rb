class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
    	t.string :date
    	t.string :vessel
    	t.string :captain
    	t.decimal :rating, precision: 2, scale: 1
    	t.text :comments
    	t.integer :location_id
    	t.integer :user_id

      t.timestamps
    end
  end
end
