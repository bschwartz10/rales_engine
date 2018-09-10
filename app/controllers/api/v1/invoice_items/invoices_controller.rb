module Api::V1::InvoiceItems
  class InvoicesController < ApplicationController
    def show
      @invoice = InvoiceItem.find(params[:id]).invoice
      render '/api/v1/invoices/show'
    end
  end
end
