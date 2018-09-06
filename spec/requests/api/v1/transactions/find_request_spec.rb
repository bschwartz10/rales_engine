require 'rails_helper'

describe 'Transactions Find API' do
  it "sends a single transaction based on attribute" do
    credit_card_number = create(:transaction).credit_card_number

    get "/api/v1/transactions/find?credit_card_number=#{credit_card_number}"

    transaction = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(transaction).to be_a(Hash)
    expect(transaction['credit_card_number']).to eq(credit_card_number)
  end

  it "sends a list of transactions based on attribute" do
    create_list(:transaction, 2)

    get "/api/v1/transactions/find_all?credit_card_number=#{Transaction.first.credit_card_number}"

    transactions = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(transactions).to be_an(Array)
  end
end
