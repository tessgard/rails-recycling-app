class TransactionsController < ApplicationController
  def create
    @transaction = transaction.new(transaction_params)

    @transaction.save
          
end

def new
    @transaction = transaction.new
end

def show
    @transaction = transaction.find(params[:id])
end

def checkout
end

end
