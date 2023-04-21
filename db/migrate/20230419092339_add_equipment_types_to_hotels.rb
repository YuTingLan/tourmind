# frozen_string_literal: true

class AddEquipmentTypesToHotels < ActiveRecord::Migration[6.1]
  def change
    add_column :hotels, :euipment_types, :string, array: true, default: []
  end
end
