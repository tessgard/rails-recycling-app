class TransactionsController < ApplicationController
  def index
    @transaction = Transaction.all
    
  end
  def create
    @transaction = Transaction.new
    @transaction.user_id = params[:user_id]
    @transaction.business_id = params[:business_id]
    @transaction.product_id = params[:product_id]
    @transaction.save
    redirect_to transactions_path
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
