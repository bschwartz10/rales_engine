require 'rails_helper'

describe 'Item Find API' do
  it "sends a single item based on attribute" do
    name = create(:item).name

    get "/api/v1/items/find?name=#{name}"

    item = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(item).to be_a(Hash)
    expect(item['name']).to eq(name)
  end

  it "sends a list of items based on attribute" do
    create_list(:item, 2)

    get "/api/v1/items/find_all?name=#{Item.first.name}"

    items = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(items).to be_an(Array)
  end
end
