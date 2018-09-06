require 'rails_helper'

describe 'Merchants Find API' do
  it "sends a single merchant based on attribute" do
    name = create(:merchant).name

    get "/api/v1/merchants/find?name=#{name}"

    merchant = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(merchant).to be_a(Hash)
    expect(merchant['name']).to eq(name)
  end

  it "sends a list of merchants based on attribute" do
    create_list(:merchant, 2)

    get "/api/v1/merchants/find_all?name=#{Merchant.first.name}"

    merchants = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(merchants).to be_an(Array)
  end
end
