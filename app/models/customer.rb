class Customer < ApplicationRecord
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :merchants, through: :invoices

  def favorite_merchant
    merchants
    .joins(invoices: [:invoice_items, :transactions])
    .group(:id)
    .order('sum(quantity) desc')
    .first
  end

end
