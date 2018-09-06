require 'rails_helper'

describe 'Invoice model spec' do
  it "belongs to invoice" do
    transaction = create(:transaction)
    expect(transaction).to respond_to(:invoice)
  end
end
