module Api::V1::Items
  class BestDayController < ApplicationController
    def show
      @best_day = Item.find(params[:id]).best_day
    end
  end
end
