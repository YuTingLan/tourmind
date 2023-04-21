# frozen_string_literal: true

class AddImageToHotels < ActiveRecord::Migration[6.1]
  def change
    add_column :hotels, :image, :string
  end
end
