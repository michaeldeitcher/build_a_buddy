class CreateAccessoriesStuffedAnimals < ActiveRecord::Migration[5.2]
  def change
    create_table :accessories_stuffed_animals do |t|
      t.belongs_to :accessory, index: true
      t.belongs_to :stuffed_animal, index: true
    end
  end
end
