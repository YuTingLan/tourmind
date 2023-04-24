class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :title
      t.text :content
      t.string :author
      t.float :rating
      t.string :location

      t.timestamps
    end
  end
end
