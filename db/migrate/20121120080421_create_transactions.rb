class CreateTransactions < ActiveRecord::Migration
  def self.up
    create_table :transactions do |t|
      t.integer :from_account_id
      t.integer :to_account_id
      t.float :amount
      t.string :currency

      t.timestamps
    end
  end

  def self.down
    drop_table :transactions
  end
end
