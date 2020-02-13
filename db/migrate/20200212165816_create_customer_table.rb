class CreateCustomerTable < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :address
      t.integer :bank_account
    end
  end
end
