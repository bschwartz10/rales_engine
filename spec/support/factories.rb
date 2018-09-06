FactoryBot.define do

  factory :merchant do
    name { 'Schroeder-Jerde' }
    created_at { "2012-03-27 14:53:59" }
    updated_at { "2012-03-27 14:53:59" }
  end

  factory :customer do
    first_name { 'Joey' }
    last_name { 'Ondricka' }
    created_at { "2012-03-27 14:53:59" }
    updated_at { "2012-03-27 14:53:59" }
  end

  factory :transaction do
    invoice
    credit_card_number { '4654405418249632' }
    result { 'success' }
    created_at { "2012-03-27 14:53:59" }
    updated_at { "2012-03-27 14:53:59" }
  end

  factory :invoice do
    customer
    merchant
    status { 'shipped' }
    created_at { "2012-03-27 14:53:59" }
    updated_at { "2012-03-27 14:53:59" }
  end

end
