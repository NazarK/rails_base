class CreateCurrencyConversions < ActiveRecord::Migration
  def self.up
    create_table :currency_conversions do |t|
      t.string :from_currency
      t.string :to_currency
      t.float :coefficient

      t.timestamps
    end
  end

  def self.down
    drop_table :currency_conversions
  end
end
