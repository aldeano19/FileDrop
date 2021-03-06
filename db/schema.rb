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

ActiveRecord::Schema.define(version: 2018_07_21_003951) do

  create_table "docxes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "filename"
    t.string "words"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "myfile_file_name"
    t.string "myfile_content_type"
    t.integer "myfile_file_size"
    t.datetime "myfile_updated_at"
  end

end
