# frozen_string_literal: true

class AddDiamondGradeToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :diamond_grade, :string
    add_column :users, :amount, :string
  end
end
