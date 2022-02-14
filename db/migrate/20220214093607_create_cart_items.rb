class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.references :items, foreign_key: true #商品id_fk
      t.references :customers, foreign_key: true #会員id_fk
      t.integer :amount, null: false
      t.datetime :created_at, null: false, default: now
      t.datetime :updated_at, null: false, default: now

      t.timestamps
    end
  end
end
