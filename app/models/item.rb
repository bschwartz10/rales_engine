class Item < ApplicationRecord
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  belongs_to :merchant

  def unit_price_in_dollars
    sprintf("%.2f", unit_price.to_f / 100)
  end

  def self.most_revenue(quantity)
    joins(:invoice_items)
    .group(:id)
    .order('sum(quantity * cast(invoice_items.unit_price as int)) desc')
    .limit(quantity)
  end

  def self.most_items(quantity)
    joins(:invoice_items)
    .group(:id)
    .order('sum(invoice_items.quantity) desc')
    .limit(quantity)
  end

  def best_day
    invoices
    .group(:id)
    .order('sum(invoice_items.quantity) desc')
    .first
    .created_at
  end

end
