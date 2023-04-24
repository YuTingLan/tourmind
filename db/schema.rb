# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_230_418_182_125) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'restaurants', force: :cascade do |t|
    t.string 'name'
    t.text 'intro'
    t.string 'address'
    t.string 'lat'
    t.string 'long'
    t.string 'image'
    t.string 'section'
    t.string 'email'
    t.string 'tel'
    t.string 'website'
    t.integer 'restaurant_type'
    t.string 'cuisine_types', default: [], array: true
    t.float 'price'
    t.string 'atmostphere', default: [], array: true
    t.string 'michelin_star'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'uid'
    t.string 'name'
    t.string 'tel'
    t.string 'city'
    t.string 'location'
    t.string 'address'
    t.string 'avatar_url'
    t.string 'provider'
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end
end
