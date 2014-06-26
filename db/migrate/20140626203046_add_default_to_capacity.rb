class AddDefaultToCapacity < ActiveRecord::Migration
  def change
    change_column :restaurants, :capacity, :integer, :default => 1, :null => false
  end
end
