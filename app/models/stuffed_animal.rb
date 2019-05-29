class StuffedAnimal < ApplicationRecord
  has_and_belongs_to_many :accessories
  has_and_belongs_to_many :purchase_orders

  def purchase_suggestion
    purchase_orders.each do |po|
      stuffy = po.stuffed_animals.where.not(id: id).first
      return stuffy if stuffy
      accessory = po.accessories.first
      return accessory if accessory
    end
    return nil
  end
end
