class CarditemsController < ApplicationController
    def new
        @carditem = Carditem.new
    end
      
    def create
      @carditem = Carditem.new(item: find_item, cart: current_user.cart)
        if @carditem.save
          redirect_to '/', notice: "Item Ajouté au panier"
        else
          render :new
        end
    end

    def destroy
        @carditem = find_carditem
        @carditem.first.delete
        redirect_to '/'
    end

    private 
    
    def find_item
        @item = Item.find(params[:id])
    end

    def find_carditem
        Carditem.all.each do |cart|
            @carditem = cart if (cart.id == current_user.cart && cart.item == find_item)
        end
    end
end
