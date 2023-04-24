class ChangeTypesBackToInt < ActiveRecord::Migration[6.1]
  def change
    change_column :restaurants, :types, :integer, using: 'price::integer'
  end
end
