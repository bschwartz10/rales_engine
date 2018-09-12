module Api::V1::Items
  class MostItemsController < ApplicationController
    def index
      @items = Item.most_items(params[:quantity])
      render '/api/v1/items/index'
    end
  end
end
