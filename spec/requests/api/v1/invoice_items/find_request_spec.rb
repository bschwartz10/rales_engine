require 'rails_helper'

describe 'InvoiceItems Find API' do
  it "sends a single invoice_item based on attribute" do
    quantity = create(:invoice_item).quantity

    get "/api/v1/invoice_items/find?quantity=#{quantity}"

    invoice_item = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(invoice_item).to be_a(Hash)
    expect(invoice_item['quantity']).to eq(quantity)
  end

  it "sends a list of invoice_items based on attribute" do
    create_list(:invoice_item, 2)

    get "/api/v1/invoice_items/find_all?quantity=#{InvoiceItem.first.quantity}"

    invoice_items = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(invoice_items).to be_an(Array)
  end
end
