class PaniersController < ApplicationController

  def show
  	if user_signed_in?
  		if current_user.paniers.last.validated?
    		@panier = Panier.new(user_id: current_user, validated: false)
    		@panier.save
   	 	
   	 	else
   	 		@panier = current_user.paniers.last
   	 	end
  	else
  		flash[:error] = "Veuillez vous connecter pour avoir un panier"
  		redirect_to '/users/sign_in'
  	end
  end

  def add
    if user_signed_in?
      if current_user.paniers.last.validated?
        panier = Panier.new(user_id: current_user, validated: false)
        panier.save
      
      else
        panier = current_user.paniers.last
      end

      list_res = panier.reservations.all
      index = list_res.index {|e| e.article_id == params[:article_id].to_i}

      if index.nil?
        res = Reservation.new(article_id: params[:article_id],panier_id: panier.id, quantity: params[:quantity])
      else
        res = list_res.at(index)
        res.quantity+=params[:quantity].to_i
      end
      res.save
      redirect_to '/panier'
    else
      flash[:error] = "Veuillez vous connecter pour avoir un panier"
      redirect_to '/users/sign_in'
    end
  end

end



