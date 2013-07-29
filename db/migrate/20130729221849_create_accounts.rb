class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :user_id
      t.string :bank_name
      t.string :account_num
      t.string :nickname
      t.decimal :balance, precision: 13, scale: 2
      t.timestamps
    end
    add_index :accounts, [:user_id, :balance]
  end
end
