# == Schema Information
#
# Table name: currency_conversions
#
#  id            :integer          not null, primary key
#  from_currency :string(255)
#  to_currency   :string(255)
#  coefficient   :float
#  created_at    :datetime
#  updated_at    :datetime
#

class CurrencyConversion < ActiveRecord::Base
   def self.convert from,to
   	  return 1 if from==to
      rec = CurrencyConversion.where(:from_currency=>from,:to_currency=>to).first
      if rec
      	return rec.coefficient
      else
      	rec = CurrencyConversion.where(:from_currency=>to,:to_currency=>from).first
      	return 1.0/rec.coefficient;
      end
   end
end
