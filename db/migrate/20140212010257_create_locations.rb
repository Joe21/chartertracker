class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
    	t.string :name, unique: true
    	t.boolean :verified, default: false

      t.timestamps
    end
  end
end