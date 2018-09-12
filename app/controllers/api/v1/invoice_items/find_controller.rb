module Api::V1::InvoiceItems
  class FindController < ApplicationController

    def index
      @invoice_items = InvoiceItem.where(invoice_item_params)
      render 'api/v1/invoice_items/index'

    end

    def show
      @invoice_item = InvoiceItem.find_by(invoice_item_params)
      render 'api/v1/invoice_items/show'
    end

    private

    def invoice_item_params
      params[:unit_price] = (params[:unit_price].to_f * 100).round if params[:unit_price]
      params.permit(:id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at)
    end

  end


end
