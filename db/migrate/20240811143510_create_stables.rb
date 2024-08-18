class CreateStables < ActiveRecord::Migration[7.2]
  def change
    create_table :stables do |t|
      t.string :name
      t.references :address, null: false, foreign_key: true

      t.timestamps
    end
  end
end
