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

  def self.best_profit
    StuffedAnimal.select("*, sale_price - cost AS profit").order("profit DESC").first
  end

  def accessories_on_a_budget budget
    to_return = []
    accessories.select("*, sale_price - cost AS profit").order("profit DESC").each do |a|
      if budget > a.sale_price
        budget -= a.sale_price
        to_return << a
      end
    end
    to_return
  end
end
