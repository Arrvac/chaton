class CartsController < ApplicationController
  before_action :authenticate_user!

  def index
    @carts = Cart.all
  end

  def show
    @cart = Cart.find_by(user_id: params[:id])
  end

  def update
    @cart = find_cart
    @cart.update(carts_params)
    redirect_to @cart
  end

  def edit
    @cart = find_cart
  end

  private

  def carts_params
    params.require(:cart).permit(:adress, :adress_sup, :ville, :code)
  end

  def find_cart
    @cart = Cart.find(params[:id])
  end

  def send_email
    UserMailer.ask_order_email(self).deliver_now
  end
end
