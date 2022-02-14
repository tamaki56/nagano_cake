class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :customers, foreign_key: true #会員id_fk
      t.string :postal_code, null: false
      t.string :address, null: false
      t.string :name, null: false
      t.integer :shipping_cost, null: false
      t.integer :total_payment, null: false
      t.integer :payment_method, null: false, default: 0 #enum
      t.integer :status, null: false, default: 0         #enum
      t.datetime :created_at, null: false, default: now
      t.datetime :updated_at, null: false, default: now
      

      t.timestamps
    end
  end
end
