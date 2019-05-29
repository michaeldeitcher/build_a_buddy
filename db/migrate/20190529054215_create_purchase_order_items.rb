class CreatePurchaseOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_order_items do |t|
      t.references :purchase_order, foreign_key: true, index: true
      t.integer :quantity
      t.references :item, polymorphic: true, index: true
      t.timestamps
    end
  end
end
