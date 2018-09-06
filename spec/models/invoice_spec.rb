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
end
