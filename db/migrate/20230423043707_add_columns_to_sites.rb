class AddColumnsToSites < ActiveRecord::Migration[6.1]
  def change
     add_column :sites, :image, :string
     add_column :sites, :parking, :string
  end
end
