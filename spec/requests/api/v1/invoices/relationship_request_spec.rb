require 'rails_helper'

describe 'Invoices Relationship API' do
  it "sends a list of transactions attached to a invoice" do
    invoice = create(:invoice)
    create_list(:transaction, 2, invoice: invoice)

    get "/api/v1/invoices/#{invoice.id}/transactions"

    transactions = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(transactions.count).to eq(2)
    expect(transactions[0]['invoice_id']).to eq(Transaction.first.invoice.id)
  end

  it "sends a list of invoice items attached to a invoice" do
    invoice = create(:invoice)
    create_list(:invoice_item, 2, invoice: invoice)

    get "/api/v1/invoices/#{invoice.id}/invoice_items"

    invoice_items = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(invoice_items.count).to eq(2)
    expect(invoice_items[0]['invoice_id']).to eq(InvoiceItem.first.invoice.id)
  end

  it "sends a list of items attached to a invoice" do
    invoice = create(:invoice)
    item_one = create(:item)
    item_two = create(:item)
    create(:invoice_item, invoice: invoice, item: item_one)
    create(:invoice_item, invoice: invoice, item: item_two)

    get "/api/v1/invoices/#{invoice.id}/items"

    items = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(items.count).to eq(2)
    expect(items[0]['id']).to eq(InvoiceItem.first.item_id)
  end

  it "sends a single customer attached to a invoice" do
    customer = create(:customer)
    invoice = create(:invoice, customer: customer)

    get "/api/v1/invoices/#{invoice.id}/customer"

    customer = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(customer).to be_a(Hash)
    expect(customer['id']).to eq(Invoice.first.customer_id)
  end
  it "sends a single merchant attached to a invoice" do
    merchant = create(:merchant)
    invoice = create(:invoice, merchant: merchant)

    get "/api/v1/invoices/#{invoice.id}/merchant"

    merchant = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(merchant).to be_a(Hash)
    expect(merchant['id']).to eq(Invoice.first.merchant_id)
  end

end
