class AddTelToSites < ActiveRecord::Migration[6.1]
  def change
    add_column :sites, :tel, :string
  end
end
