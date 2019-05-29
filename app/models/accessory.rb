class Accessory < ApplicationRecord
  has_and_belongs_to_many :stuffed_animals
  has_and_belongs_to_many :purchase_orders

  def purchase_suggestion
    purchase_orders.each do |po|
      stuffy = po.stuffed_animals.first
      return stuffy if stuffy
      accessory = po.accessories.where.not(id: id).first
      return accessory if accessory
    end
    return nil
  end
end
