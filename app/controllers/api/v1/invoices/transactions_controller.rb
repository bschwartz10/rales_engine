module Api::V1::Invoices
  class TransactionsController < ApplicationController
    def index
      @transactions = Invoice.find(params[:id]).transactions
      render 'api/v1/transactions/index'
    end
  end
end
