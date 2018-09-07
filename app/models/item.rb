class Item < ApplicationRecord
  has_many :invoice_items
  belongs_to :merchant

  def unit_price_in_dollars
    sprintf("%.2f", unit_price.to_f / 100)
  end

end
