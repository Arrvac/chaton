class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def edit
    @item = find_item
  end

  def update
    @item = find_item
    @item.update(items_params)
    redirect_to @item
  end

  def show
    @item = find_item
  end

  def destroy
    @item = find_item
    @item.delete
    redirect_to '/', notice: "Produit supprimé"
  end

  def create
    @item = Item.create(items_params)

    if @item.save
      redirect_to @item, notice: "New item created"
    else
      render :new
    end
  end

  private

  def items_params
    params.require(:item).permit(:title, :description, :price, :avatar)
  end

  def find_item
    @item = Item.find(params[:id])
  end
end
