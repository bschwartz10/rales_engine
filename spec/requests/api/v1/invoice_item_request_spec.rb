require 'rails_helper'

describe 'Invoice Items API' do
  it "sends a list of all invoice_items" do
    create_list(:invoice_item, 2)

    get '/api/v1/invoice_items'

    invoice_items = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(invoice_items).to be_an(Array)
    expect(invoice_items.count).to eq(2)
  end

  it "sends a list of one invoice_item" do
    id = create(:invoice_item).id

    get "/api/v1/invoice_items/#{id}"

    invoice_item = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(invoice_item).to be_an(Hash)
    expect(invoice_item['id']).to eq(id)
  end

end
