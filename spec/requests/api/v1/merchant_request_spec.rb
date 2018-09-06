require 'rails_helper'

describe 'Merchants API' do
  it "sends a list of all merchants" do
    create_list(:merchant, 2)

    get '/api/v1/merchants'

    merchants = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(merchants).to be_an(Array)
    expect(merchants.count).to eq(2)
  end

  it "sends one merchant based on id attribute" do
    id = create(:merchant).id

    get "/api/v1/merchants/#{id}"

    merchant = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(merchant).to be_a(Hash)
    expect(merchant['id']).to eq(id)
  end
end
