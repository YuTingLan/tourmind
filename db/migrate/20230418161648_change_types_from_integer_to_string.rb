class ChangeTypesFromIntegerToString < ActiveRecord::Migration[6.1]
  def change
    change_column :restaurants, :types, :string
  end
end
