module Api::V1::Invoices
  class CustomersController < ApplicationController
    def show
      @customer = Invoice.find(params[:id]).customer
      render 'api/v1/customers/show'
    end
  end
end
