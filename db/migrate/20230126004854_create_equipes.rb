class CreateEquipes < ActiveRecord::Migration[7.0]
  def change
    create_table :equipes do |t|
      t.string :nome
      t.integer :total_jogadores
      t.integer :total_defesa
      t.integer :total_ataque
      t.integer :total_meio
      t.string :imagem

      t.timestamps
    end
  end
end
