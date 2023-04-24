class ChangeCuisineTypesToArrayOfString < ActiveRecord::Migration[6.1]
  def change
    change_column :restaurants, :cuisine_types, :text, array: true, default: [],
                                                       using: "(string_to_array(cuisine_types, ','))"
  end
end
