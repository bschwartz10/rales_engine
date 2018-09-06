require 'rails_helper'

describe 'Transactions API' do
  it "sends a list of all transactions" do
    create_list(:transaction, 2)

    get '/api/v1/transactions'

    transactions = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(transactions).to be_an(Array)
    expect(transactions.count).to eq(2)
  end

  it "sends one transaction based on id attribute" do
    id = create(:transaction).id

    get "/api/v1/transactions/#{id}"

    transaction = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(transaction).to be_a(Hash)
    expect(transaction['id']).to eq(id)
  end
end
