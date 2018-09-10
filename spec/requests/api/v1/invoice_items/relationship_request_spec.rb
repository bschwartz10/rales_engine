require 'rails_helper'

describe 'Invoice Items Relationship API' do

  it "sends a single invoice attached to a invoice item" do
    invoice = create(:invoice)
    invoice_item = create(:invoice_item, invoice: invoice)

    get "/api/v1/invoice_items/#{invoice_item.id}/invoice"

    invoice = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(invoice).to be_a(Hash)
    expect(invoice['id']).to eq(InvoiceItem.first.invoice_id)
  end

  it "sends a single item attached to a invoice item" do
    item = create(:item)
    invoice_item = create(:invoice_item, item: item)

    get "/api/v1/invoice_items/#{invoice_item.id}/item"

    item = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(item).to be_a(Hash)
    expect(item['id']).to eq(InvoiceItem.first.item_id)
  end

end
