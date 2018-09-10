module Api::V1::Items
  class MerchantsController < ApplicationController

    def show
      @merchant = Item.find(params[:id]).merchant
      render 'api/v1/merchants/show'
    end

  end


end
