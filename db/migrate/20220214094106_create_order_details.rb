class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer :item_id, null: false #商品id_fk
      t.integer :order_id, null: false #注文id_fk
      t.integer :amount, null: false
      t.integer :price, null: false
      t.integer :making_status, null: false, default: 0 #enum
      t.datetime :created_at, null: false, default: now
      t.datetime :updated_at, null: false, default: now

      t.timestamps
    end
  end
end
