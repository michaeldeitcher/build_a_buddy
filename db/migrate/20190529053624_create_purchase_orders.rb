class CreatePurchaseOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_orders do |t|
      t.datetime :purchased_at

      t.timestamps
    end
  end
end
