class CreatePartidas < ActiveRecord::Migration[7.0]
  def change
    create_table :partidas do |t|
      t.references :time1
      t.references :time2
      t.string :data_partida
      t.references :vencedor

      t.timestamps
    end
  end
end
