class RenameTypesToRestaurantType < ActiveRecord::Migration[6.1]
  def change
    rename_column :restaurants, :types, :restaurant_type
  end
end
