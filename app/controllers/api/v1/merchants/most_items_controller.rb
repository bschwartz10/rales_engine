module Api::V1::Merchants
  class MostItemsController < ApplicationController
    def index
      @merchants = Merchant.most_items(params[:quantity])
      render '/api/v1/merchants/index'
    end
  end
end
