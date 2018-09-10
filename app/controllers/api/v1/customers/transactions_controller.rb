module Api::V1::Customers
  class TransactionsController < ApplicationController

    def index
      @transactions = Customer.find(params[:id]).transactions
      render 'api/v1/transactions/index'
    end

  end
end
