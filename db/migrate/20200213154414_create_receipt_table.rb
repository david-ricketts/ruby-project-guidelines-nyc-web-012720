class CreateReceiptTable < ActiveRecord::Migration[5.0]
  def change
    create_table :receipts do |t|
      t.integer :customer_id
      t.integer :restaurant_id
      t.integer :total
    end
  end
end
