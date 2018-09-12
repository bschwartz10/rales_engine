module Api::V1::Invoices
  class FindController < ApplicationController

    def index
      @invoices = Invoice.where(invoice_params)
      render 'api/v1/invoices/index'
    end

    def show
      @invoice = Invoice.find_by(invoice_params)
      render 'api/v1/invoices/show'
    end

    private

    def invoice_params
      params.permit(:id, :customer_id, :merchant_id, :status, :created_at, :updated_at)
    end

  end


end
