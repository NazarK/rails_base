# == Schema Information
#
# Table name: transactions
#
#  id              :integer          not null, primary key
#  from_account_id :integer
#  to_account_id   :integer
#  amount          :float
#  currency        :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class Transaction < ActiveRecord::Base
    belongs_to :from_account, :class_name=>"Account", :foreign_key=>"from_account_id"
	belongs_to :to_account, :class_name=>"Account", :foreign_key=>"to_account_id"

    def amount_in_currency currency
      if currency==self.currency
      	return self.amount
      else
      	return self.amount*(CurrencyConversion.convert(self.currency, currency))
      end
    end
end
