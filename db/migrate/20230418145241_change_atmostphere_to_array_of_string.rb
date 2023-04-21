class ChangeAtmostphereToArrayOfString < ActiveRecord::Migration[6.1]
  def change
    change_column :restaurants, :atmostphere, :text, array: true, default: [],
                                                     using: "(string_to_array(atmostphere, ','))"
  end
end
