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

require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
