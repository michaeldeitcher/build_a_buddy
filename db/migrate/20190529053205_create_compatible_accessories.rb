class CreateCompatibleAccessories < ActiveRecord::Migration[5.2]
  def change
    create_table :compatible_accessories do |t|
      t.references :stuffed_animal, foreign_key: true, index: true
      t.references :accessory, foreign_key: true, index: true

      t.timestamps
    end
  end
end
