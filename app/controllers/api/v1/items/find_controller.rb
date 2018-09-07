module Api::V1::Items
  class FindController < ApplicationController

    def index
      @items = Item.where(item_params)
    end

    def show
      @item = Item.order(id: :asc).find_by(item_params)
    end

    private

    def item_params
      params[:unit_price] = (params[:unit_price].to_f * 100).round if params[:unit_price]
      params.permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
    end

  end


end
