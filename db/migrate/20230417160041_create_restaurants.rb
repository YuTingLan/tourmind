# frozen_string_literal: true

class CreateRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :intro
      t.string :address
      t.string :lat
      t.string :long
      t.string :image
      t.string :section
      t.string :email
      t.string :tel
      t.string :website
      t.integer :types
      t.text :cuisine_types
      t.float :price
      t.text :atmostphere
      t.string :michelin_star

      t.timestamps
    end
  end
end
