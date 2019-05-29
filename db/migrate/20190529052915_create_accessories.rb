class CreateAccessories < ActiveRecord::Migration[5.2]
  def change
    create_table :accessories do |t|
      t.string :description
      t.string :size
      t.integer :cost
      t.integer :sale_price
      t.integer :inventory

      t.timestamps
    end
  end
end
