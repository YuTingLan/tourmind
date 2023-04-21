class AddSiteTypesToSites < ActiveRecord::Migration[6.1]
  def change
    add_column :sites, :site_types, :string, array: true, default: []
  end
end
