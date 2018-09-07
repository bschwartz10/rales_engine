require 'rails_helper'

describe 'Item API' do
  it "sends a list of items" do
    create_list(:item, 2)

    get '/api/v1/items'

    items = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(items).to be_an(Array)
    expect(items.count).to eq(2)
  end

  it "sends a single item" do
    id = create(:item).id

    get "/api/v1/items/#{id}"

    item = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(item).to be_a(Hash)
    expect(item['id']).to eq(id)
  end
end
