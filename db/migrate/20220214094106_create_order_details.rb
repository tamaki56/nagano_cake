class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.references :items, foreign_key: true #商品id_fk
      t.references :orders, foreign_key: true #注文id_fk
      t.integer :amount, null: false
      t.integer :price, null: false
      t.integer :making_status, null: false, default: 0 #enum
      t.datetime :created_at, null: false, default: now
      t.datetime :updated_at, null: false, default: now

      t.timestamps
    end
  end
end
