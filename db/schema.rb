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

ActiveRecord::Schema[7.0].define(version: 2023_10_16_201538) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.integer "intelligence"
    t.integer "strength"
    t.integer "speed"
    t.integer "durability"
    t.integer "power"
    t.integer "combat"
    t.string "full_name"
    t.string "place_of_birth"
    t.string "publisher"
    t.string "alignment"
    t.string "gender"
    t.string "race"
    t.string "height"
    t.string "weight"
    t.string "eye_color"
    t.string "hair_color"
    t.string "group_affiliation"
    t.string "image"
    t.float "power_stats_weighted_average"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
