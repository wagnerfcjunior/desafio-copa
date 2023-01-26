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

ActiveRecord::Schema[7.0].define(version: 2023_01_26_114652) do
  create_table "equipes", force: :cascade do |t|
    t.string "nome"
    t.integer "total_jogadores"
    t.integer "total_defesa"
    t.integer "total_ataque"
    t.integer "total_meio"
    t.string "imagem"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "partidas", force: :cascade do |t|
    t.integer "time1_id"
    t.integer "time2_id"
    t.string "data_partida"
    t.integer "vencedor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["time1_id"], name: "index_partidas_on_time1_id"
    t.index ["time2_id"], name: "index_partidas_on_time2_id"
    t.index ["vencedor_id"], name: "index_partidas_on_vencedor_id"
  end

end
