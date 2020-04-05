class CreateTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :types do |t|
      t.json :name
      t.timestamps
    end
  end
end
