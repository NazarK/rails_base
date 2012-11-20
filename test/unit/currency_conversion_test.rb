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

require 'test_helper'

class CurrencyConversionTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
