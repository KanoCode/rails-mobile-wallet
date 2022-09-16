class TransactionController < ApplicationController
  def index
    @transactions = Payment.all
  end

  def new
    @payment = Payment.new  
  end


  def create
    @transaction = Payment.new(transaction_params)    
    @transaction.user_id = 1
    #reference to category
    @transaction.category_ids = params[:payment][:category_id]
    if @transaction.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def destroy
  #   food = Food.find(params[:id])
  #   food.destroy
  #   redirect_to foods_path
  # end

  private

  def transaction_params
    params.require(:payment).permit(:name, :amount)
  end


end
