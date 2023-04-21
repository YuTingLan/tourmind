# frozen_string_literal: true

class AddHotelStyleToHotels < ActiveRecord::Migration[6.1]
  def change
    add_column :hotels, :hotel_types, :string, array: true, default: []
  end
end
