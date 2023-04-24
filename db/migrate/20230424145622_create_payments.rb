# frozen_string_literal: true

class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.integer :amount
      t.datetime :pay_time
      t.string :status

      t.timestamps
    end
  end
end
