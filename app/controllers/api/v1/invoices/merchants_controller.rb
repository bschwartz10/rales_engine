module Api::V1::Invoices
  class MerchantsController < ApplicationController
    def show
      @merchant = Invoice.find(params[:id]).merchant
      render 'api/v1/merchants/show'
    end
  end
end
