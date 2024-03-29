class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.integer :item_id, null: false #商品id_fk
      t.integer :customer_id, null: false #会員id_fk
      t.integer :amount, null: false

      t.timestamps
    end
  end
end
