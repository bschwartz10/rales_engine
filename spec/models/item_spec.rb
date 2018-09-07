require 'rails_helper'

describe 'Item model spec' do
  it "belongs to a merchant" do
    items = create(:item)
    expect(items).to respond_to(:merchant)
  end
  it "has many invoice items" do
    items = create(:item)
    expect(items).to respond_to(:invoice_items)
  end
end
