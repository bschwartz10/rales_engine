module Api::V1::Items
  class MostRevenueController < ApplicationController
    def index
      @items = Item.most_revenue(params[:quantity])
      render '/api/v1/items/index'
    end
  end
end
