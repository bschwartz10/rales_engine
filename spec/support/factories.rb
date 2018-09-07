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

  factory :item do
    name { 'Item Qui Esse' }
    description { 'Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.' }
    unit_price { '75107' }
    merchant
    created_at { "2012-03-27 14:53:59" }
    updated_at { "2012-03-27 14:53:59" }
  end

  factory :invoice_item do
    item
    invoice
    quantity { 5 }
    unit_price { '13635' }
  end

end
