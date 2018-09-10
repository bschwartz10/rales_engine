module Api::V1::Invoices
  class InvoiceItemsController < ApplicationController
    def index
      @invoice_items = Invoice.find(params[:id]).invoice_items
      render '/api/v1/invoice_items/index'
    end
  end
end
