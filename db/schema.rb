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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20130923194450) do

  create_table "authors", force: true do |t|
    t.string   "username",         null: false
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.string   "author_name"
    t.text     "body"
    t.integer  "profil_id"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["author_id"], name: "index_comments_on_author_id"
  add_index "comments", ["profil_id"], name: "index_comments_on_profil_id"

  create_table "invitations", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "offres", force: true do |t|
    t.string   "titre"
    t.text     "description"
    t.string   "nom_restaurant"
    t.text     "photo"
    t.string   "auteur"
    t.float    "prix_medium"
    t.float    "prix_large"
    t.integer  "profil_id"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "offres", ["author_id"], name: "index_offres_on_author_id"
  add_index "offres", ["profil_id"], name: "index_offres_on_profil_id"

  create_table "profils", force: true do |t|
    t.string   "nom"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "profil_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "taggings", ["profil_id"], name: "index_taggings_on_profil_id"
  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id"

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
