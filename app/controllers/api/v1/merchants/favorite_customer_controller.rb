module Api::V1::Merchants
  class FavoriteCustomerController < ApplicationController
    def show
      @favorite_customer = Merchant.find(params[:id]).favorite_customer
    end
  end
end
