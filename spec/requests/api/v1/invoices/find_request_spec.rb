require 'rails_helper'

describe 'Invoice Find API' do
  it "sends a single invoice based on attribute" do
    status = create(:invoice).status

    get "/api/v1/invoices/find?status=#{status}"

    invoice = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(invoice).to be_a(Hash)
    expect(invoice['status']).to eq(status)
  end

  it "sends a list of invoices based on attribute" do
    create_list(:invoice, 2)

    get "/api/v1/invoices/find_all?status=#{Invoice.first.status}"

    invoices = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(invoices).to be_an(Array)
  end
end
