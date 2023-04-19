class ChangeTextArrayToStringArrayForAtmostphereAndCuisineTypes < ActiveRecord::Migration[6.1]
  def change
    change_column :restaurants, :cuisine_types, :string, array: true, default: []
    change_column :restaurants, :atmostphere, :string, array: true, default: []
  end
end
