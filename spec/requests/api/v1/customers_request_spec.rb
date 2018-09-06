require 'rails_helper'

describe 'Customers API' do
  it "sends a list of all customers" do
    create_list(:customer, 2)

    get '/api/v1/customers'

    customers = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(customers).to be_an(Array)
    expect(customers.count).to eq(2)
  end

  it "sends a list of one customer" do
    id = create(:customer).id

    get "/api/v1/customers/#{id}"

    customer = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(customer).to be_an(Hash)
    expect(customer['id']).to eq(id)
  end

end
