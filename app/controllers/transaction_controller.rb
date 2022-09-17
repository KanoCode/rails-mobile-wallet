class TransactionController < ApplicationController
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    @transactions = Payment.all
  end

  def new
    @payment = Payment.new
  end

  def create
    @transaction = Payment.new(transaction_params)
    @transaction.user_id = current_user.id
    # reference to category
    @transaction.category_ids = params[:payment][:category_id]
    if @transaction.save
      redirect_to category_path(@transaction.category_ids[0])
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    payment = Payment.find(params[:id])
    payment.destroy
    redirect_to root_path
  end

  private

  def transaction_params
    params.require(:payment).permit(:name, :amount)
  end
end
