require 'rails_helper'

describe 'Item model spec' do
  it "belongs to a merchant" do
    item = create(:item)
    expect(item).to respond_to(:merchant)
  end
  it "has many invoice items" do
    item = create(:item)
    expect(item).to respond_to(:invoice_items)
  end
  it "has many invoices" do
    item = create(:item)
    expect(item).to respond_to(:invoices)
  end
end
