module Api::V1::Transactions
  class InvoicesController < ApplicationController

    def show
      @invoice = Transaction.find(params[:id]).invoice
      render 'api/v1/invoices/show'
    end

  end
end
