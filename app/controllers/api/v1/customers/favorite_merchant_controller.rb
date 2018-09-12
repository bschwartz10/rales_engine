module Api::V1::Customers
  class FavoriteMerchantController < ApplicationController
    def show
      @favorite_merchant = Customer.find(params[:id]).favorite_merchant
    end
  end
end
