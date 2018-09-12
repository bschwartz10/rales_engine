class Transaction < ApplicationRecord
  belongs_to :invoice
  scope :sucessful, -> { where(result: 'success') }
end
