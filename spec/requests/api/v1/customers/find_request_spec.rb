require 'rails_helper'

describe 'Customers Find API' do
  it "sends a single customer based on attribute" do
    first_name = create(:customer).first_name

    get "/api/v1/customers/find?first_name=#{first_name}"

    customer = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(customer).to be_a(Hash)
    expect(customer['first_name']).to eq(first_name)
  end

  it "sends a list of customers based on attribute" do
    create_list(:customer, 2)

    get "/api/v1/customers/find_all?first_name=#{Customer.first.first_name}"

    customers = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(customers).to be_an(Array)
  end
end
