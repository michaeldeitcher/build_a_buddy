class CreatePurchaseOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_orders do |t|
      t.datetime :purchased_at

      t.timestamps
    end

    create_table :accessories_purchase_orders do |t|
      t.belongs_to :accessory, index: true
      t.belongs_to :purchase_order, index: true
    end

    create_table :purchase_orders_stuffed_animals do |t|
      t.belongs_to :purchase_order, index: true
      t.belongs_to :stuffed_animal, index: true
    end
  end
end
