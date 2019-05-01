class TransactionsController < ApplicationController
  def create
    @transaction = Transaction.new

    @transaction.save

end

def new
    @transaction = Transaction.new
end

def show
    @transaction = Transaction.find(params[:id])
end

def checkout
end

end
