module Api::V1::Merchants
  class RevenueController < ApplicationController
    def show
      @total_revenue = Merchant.revenue_per_date(params[:date])
    end
  end
end
