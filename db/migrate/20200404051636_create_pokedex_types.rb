class CreatePokedexTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :pokedex_types do |t|
      t.references :pokedex, null: false, foreign_key: true
      t.references :type, null: false, foreign_key: true
      t.timestamps
    end
  end
end
