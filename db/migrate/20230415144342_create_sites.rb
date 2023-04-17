class CreateSites < ActiveRecord::Migration[6.1]
  def change
    create_table :sites do |t|
      t.string :name
      t.integer :budget
      # 1:$ 2:$$ 3:$$$
      t.string :website
      t.string :address
      t.string :latitude
      t.string :longitude
      t.float :google_star_rating
      t.float :stay_duration
      t.text :intro
      t.string :pet_freindly
      t.string :picture

      t.timestamps
    end
  end
end
