module Api::V1::Merchants
  class MostRevenueController < ApplicationController
    def index
      @merchants = Merchant.most_revenue(params[:quantity])
      render '/api/v1/merchants/index'
    end
  end
end
