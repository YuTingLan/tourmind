class CreatePlans < ActiveRecord::Migration[6.1]
  def change
    create_table :plans do |t|
      t.string :name
      t.text :description
      t.integer :days
      t.json :locations
      t.string :images, array: true
      t.string :category

      t.timestamps
    end
  end
end
