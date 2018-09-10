require 'rails_helper'

describe 'Customers Relationship API' do

  it "sends a list of invoices attached to a customer" do
    customer = create(:customer)
    create_list(:invoice, 2, customer: customer)

    get "/api/v1/customers/#{customer.id}/invoices"

    invoices = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(invoices.count).to eq(2)
    expect(invoices[0]['customer_id']).to eq(Customer.first.id)
  end

  it "sends a list of transactions attached to a customer" do
    customer = create(:customer)
    invoice = create(:invoice, customer: customer)
    transactions = create_list(:transaction, 2, invoice: invoice)

    get "/api/v1/customers/#{customer.id}/transactions"

    transactions = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(transactions.count).to eq(2)
    expect(transactions[0]['invoice_id']).to eq(Customer.first.invoices.first.id)
  end
end
