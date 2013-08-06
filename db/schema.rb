# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130806102122) do

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.float    "price"
    t.string   "type_art"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "clothes", :force => true do |t|
    t.string   "size"
    t.string   "color"
    t.integer  "article_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "stock"
    t.integer  "reserve"
  end

  add_index "clothes", ["article_id", "created_at"], :name => "index_clothes_on_article_id_and_created_at"

  create_table "others", :force => true do |t|
    t.integer  "stock"
    t.integer  "reserve"
    t.integer  "article_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "others", ["article_id", "created_at"], :name => "index_others_on_article_id_and_created_at"

  create_table "paniers", :force => true do |t|
    t.integer  "user_id"
    t.boolean  "validated"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "paniers", ["user_id", "created_at"], :name => "index_paniers_on_user_id_and_created_at"

  create_table "reservations", :force => true do |t|
    t.integer  "article_id"
    t.integer  "panier_id"
    t.integer  "quantity"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "product_id"
    t.string   "product_type"
  end

  add_index "reservations", ["article_id"], :name => "index_reservations_on_article_id"
  add_index "reservations", ["panier_id"], :name => "index_reservations_on_panier_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.boolean  "admin",                  :default => false
    t.string   "nom"
    t.string   "prenom"
    t.text     "adresse"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
