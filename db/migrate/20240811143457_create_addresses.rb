class CreateAddresses < ActiveRecord::Migration[7.2]
  def change
    create_table :addresses do |t|
      t.string :line1
      t.string :zipcode
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
