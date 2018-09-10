require 'rails_helper'

describe 'Invoice model spec' do
  it "belongs to customer" do
    invoice = create(:invoice)
    expect(invoice).to respond_to(:merchant)
  end
  it "belongs to merchant" do
    invoice = create(:invoice)
    expect(invoice).to respond_to(:customer)
  end
  it "has many transactions" do
    invoice = create(:invoice)
    expect(invoice).to respond_to(:transactions)
  end
  it "has many invoice items" do
    invoice = create(:invoice)
    expect(invoice).to respond_to(:invoice_items)
  end
  it "has many items" do
    invoice = create(:invoice)
    expect(invoice).to respond_to(:items)
  end
end
