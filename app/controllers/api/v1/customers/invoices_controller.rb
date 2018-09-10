module Api::V1::Customers
  class InvoicesController < ApplicationController

    def index
      @invoices = Customer.find(params[:id]).invoices
      render 'api/v1/invoices/index'
    end

  end
end
