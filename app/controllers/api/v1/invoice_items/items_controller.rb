module Api::V1::InvoiceItems
  class ItemsController < ApplicationController
    def show
      @item = InvoiceItem.find(params[:id]).item
      render '/api/v1/items/show'
    end
  end
end
