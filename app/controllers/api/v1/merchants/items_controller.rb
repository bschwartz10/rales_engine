module Api::V1::Merchants
  class ItemsController < ApplicationController
    def index
      @items = Merchant.find(params[:id]).items
      render 'api/v1/items/index'
    end
  end
end
