class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.references :customers, foreign_key: true #会員id_fk
      t.string :name, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.datetime :created_at, null: false, default: now
      t.datetime :updated_at, null: false, default: now      

      t.timestamps
    end
  end
end
