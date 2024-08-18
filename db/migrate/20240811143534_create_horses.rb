class CreateHorses < ActiveRecord::Migration[7.2]
  def change
    create_table :horses do |t|
      t.string :name
      t.string :race
      t.string :color
      t.references :stable, null: false, foreign_key: true

      t.timestamps
    end
  end
end
