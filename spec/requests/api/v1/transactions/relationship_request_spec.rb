require 'rails_helper'

describe 'Transaction Relationship API' do
  it "sends a single invoice attached to a transaction" do
    invoice = create(:invoice)
    transaction = create(:transaction, invoice: invoice)

    get "/api/v1/transactions/#{transaction.id}/invoice"

    invoice = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(invoice).to be_a(Hash)
    expect(invoice['id']).to eq(Transaction.first.invoice_id)
  end
end
