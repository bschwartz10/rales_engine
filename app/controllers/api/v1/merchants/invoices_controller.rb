module Api::V1::Merchants
  class InvoicesController < ApplicationController
    def index
      @invoices = Merchant.find(params[:id]).invoices
      render '/api/v1/invoices/index'
    end
  end
end
