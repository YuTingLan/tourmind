class CreateHotels < ActiveRecord::Migration[6.1]
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :website
      t.string :star_rating
      t.string :address
      t.string :latitude
      t.string :longitude
      t.text :intro

      t.timestamps
    end
  end
end
