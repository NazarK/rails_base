class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.string :name
      t.float :amount
      t.string :currency

      t.timestamps
    end
  end

  def self.down
    drop_table :accounts
  end
end
