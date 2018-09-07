require 'rails_helper'

describe 'Invoice API' do
  it "sends a list of invoices" do
    create_list(:invoice, 2)

    get '/api/v1/invoices'

    invoices = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(invoices).to be_an(Array)
    expect(invoices.count).to eq(2)
  end

  it "sends a single invoice" do
    id = create(:invoice).id

    get "/api/v1/invoices/#{id}"

    invoice = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(invoice).to be_a(Hash)
    expect(invoice['id']).to eq(id)
  end
end
