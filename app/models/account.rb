# == Schema Information
#
# Table name: accounts
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  amount     :float
#  currency   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Account < ActiveRecord::Base
   has_many :income_transactions, :class_name => "Transaction", :foreign_key => "to_account_id"
   has_many :outcome_transactions, :class_name => "Transaction", :foreign_key => "from_account_id"

   def cur_balance need_currency=nil
   	  need_currency = self.currency if !need_currency
   	  sum = CurrencyConversion::convert(self.currency,need_currency)*self.amount
   	  income_transactions.each do |rec|
         sum += CurrencyConversion.convert(rec.currency,need_currency)*rec.amount
   	  end

      outcome_transactions.each do |rec|
         sum -= CurrencyConversion.convert(rec.currency,need_currency)*rec.amount
      end
      sum
   end
end
