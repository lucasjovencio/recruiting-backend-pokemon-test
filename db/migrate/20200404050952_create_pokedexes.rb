class CreatePokedexes < ActiveRecord::Migration[6.0]
  def change
    create_table :pokedexes do |t|
      t.json :name
      t.integer :hp
      t.integer :attack
      t.integer :defense
      t.integer :speed_attack
      t.integer :speed_defense
      t.integer :speed
      t.timestamps
    end
  end
end
