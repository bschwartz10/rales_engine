class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items
  has_many :invoice_items, through: :invoices
  has_many :customers, through: :invoices

  def self.most_revenue(quantity)
    joins(:invoice_items)
    .group(:id)
    .order('sum(quantity * cast(unit_price as int)) desc')
    .limit(quantity)
  end

  def self.most_items(quantity)
    joins(invoices: [:invoice_items, :transactions])
    .merge(Transaction.sucessful)
    .group(:id)
    .order('sum(quantity)desc')
    .limit(quantity)
  end

  def self.revenue_per_date(date)
    revenue =
      joins(invoices: [:invoice_items, :transactions])
      .where(invoices: {created_at: "#{date}"})
      .sum('quantity * cast(unit_price as int)')
    sprintf("%.2f", revenue.to_f / 100)

  end

  def most_revenue(date = nil)
    if date
      revenue =
        invoices
        .joins([:invoice_items, :transactions])
        .merge(Transaction.sucessful)
        .where(invoices: {created_at: "#{date}"})
        .sum('quantity * cast(unit_price as int)')
    else
      revenue =
        invoices
        .joins([:invoice_items, :transactions])
        .merge(Transaction.sucessful)
        .sum('quantity * cast(unit_price as int)')
    end
    sprintf("%.2f", revenue.to_f / 100)
  end

  def favorite_customer
    customers
    .joins(invoices: [:invoice_items, :transactions])
    .group(:id)
    .order('sum(quantity) desc')
    .first
  end

end
