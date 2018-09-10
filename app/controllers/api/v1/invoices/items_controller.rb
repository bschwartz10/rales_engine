module Api::V1::Invoices
  class ItemsController < ApplicationController
    def index
      @items = Invoice.find(params[:id]).items
      render 'api/v1/items/index'
    end
  end
end
