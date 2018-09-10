require 'rails_helper'

describe 'Customer model spec' do
  it "has many invoices" do
    customer = create(:customer)
    expect(customer).to respond_to(:invoices)
  end
  it "has many transactions through invoices" do
    customer = create(:customer)
    expect(customer).to respond_to(:transactions)
  end
end
