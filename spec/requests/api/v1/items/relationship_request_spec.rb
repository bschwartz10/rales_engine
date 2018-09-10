require 'rails_helper'

describe 'Items Relationship API' do
  it "sends a list of invoice_items attached to an item" do
    item = create(:item)
    create_list(:invoice_item, 2, item: item)

    get "/api/v1/items/#{item.id}/invoice_items"

    invoice_items = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(invoice_items.count).to eq(2)
    expect(invoice_items[0]['item_id']).to eq(Item.first.id)
  end

  it "sends a single merchant attached to a item" do
    merchant = create(:merchant)
    item = create(:item, merchant: merchant)

    get "/api/v1/items/#{item.id}/merchant"

    merchant = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(merchant).to be_a(Hash)
    expect(merchant['id']).to eq(Item.first.merchant_id)
  end

end
