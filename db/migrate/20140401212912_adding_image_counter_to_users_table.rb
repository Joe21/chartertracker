class AddingImageCounterToUsersTable < ActiveRecord::Migration
  def change
  	add_column :users, :image_counter, :integer, :default => 0
  end
end
