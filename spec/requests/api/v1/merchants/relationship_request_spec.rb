require 'rails_helper'

describe 'Merchant Relationship API' do
  it "sends a list of items attached to a merchant" do
    merchant = create(:merchant)
    create_list(:item, 2, merchant: merchant)

    get "/api/v1/merchants/#{merchant.id}/items"

    items = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(items.count).to eq(2)
    expect(items[0]['merchant_id']).to eq(Item.first.merchant.id)
  end

  it "sends a list of invoices attached to a merchant" do
    merchant = create(:merchant)
    create_list(:invoice, 2, merchant: merchant)

    get "/api/v1/merchants/#{Invoice.first.merchant.id}/invoices"

    invoices = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(invoices.count).to eq(2)
    expect(invoices[0]['merchant_id']).to eq(Invoice.first.merchant.id)
  end
end
