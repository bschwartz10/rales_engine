require 'csv'

task import_data: :environment do
  CSV.foreach('./lib/data/customers.csv', headers: true) do |row|
    Customer.create!(row.to_hash)
  end
  CSV.foreach('./lib/data/merchants.csv', headers: true) do |row|
    Merchant.create!(row.to_hash)
  end
  CSV.foreach('./lib/data/invoices.csv', headers: true) do |row|
    Invoice.create!(row.to_hash)
  end
  CSV.foreach('./lib/data/items.csv', headers: true) do |row|
    Item.create!(row.to_hash)
  end
  CSV.foreach('./lib/data/transactions.csv', headers: true, header_converters: :symbol) do |row|
    Transaction.create!(
      invoice_id: row[:invoice_id],
      credit_card_number: row[:credit_card_number],
      result: row[:result],
      created_at: row[:created_at],
      updated_at: row[:updated_at]
    )
  end
  CSV.foreach('./lib/data/invoice_items.csv', headers: true) do |row|
    InvoiceItem.create!(row.to_hash)
  end
end
