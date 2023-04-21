# frozen_string_literal: true

class AddTelToHotels < ActiveRecord::Migration[6.1]
  def change
    add_column :hotels, :tel, :string
  end
end
