class InvoiceItem < ApplicationRecord
  belongs_to :item
  belongs_to :invoice

  def unit_price_in_dollars
    sprintf("%.2f", unit_price.to_f / 100)
  end

end
