class AddImagesToComment < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :images, :json
  end
end
 