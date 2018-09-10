module Api::V1::Items
  class InvoiceItemsController < ApplicationController

    def index
      @invoice_items = Item.find(params[:id]).invoice_items
      render 'api/v1/invoice_items/index'
    end

  end


end
