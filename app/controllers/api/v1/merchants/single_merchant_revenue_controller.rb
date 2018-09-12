module Api::V1::Merchants
  class SingleMerchantRevenueController < ApplicationController
    def show
      @revenue = Merchant.find(params[:id]).most_revenue(params[:date])
    end
  end
end
