class CreateSites < ActiveRecord::Migration[6.1]
  def change
    create_table :sites do |t|
      t.string :name
      t.string :website
      t.string :address
      t.string :latitude
      t.string :longitude
      t.float :stay_duration
      t.text :intro
      t.string :pet_freindly

      t.timestamps
    end
  end
end
