require 'rails_helper'

describe 'Merchant model spec' do
  it "has many invoices" do
    merchant = create(:merchant)
    expect(merchant).to respond_to(:invoices)
  end
  it "has many items" do
    merchant = create(:merchant)
    expect(merchant).to respond_to(:items)
  end
end
