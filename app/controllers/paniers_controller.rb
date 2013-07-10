class PaniersController < ApplicationController

  def show
  	if user_signed_in?
      if current_user.paniers.empty?
        @panier = Panier.new(user_id: current_user.id, validated: false)
        @panier.save
      else
    		if current_user.paniers.last.validated? 
      		@panier = Panier.new(user_id: current_user.id, validated: false)
      		@panier.save
     	 	
     	 	else
     	 		@panier = current_user.paniers.last
     	 	end
       end
  	else
  		flash[:error] = "Veuillez vous connecter pour avoir un panier"
  		redirect_to '/users/sign_in'
  	end
  end


  def add
    if params[:quantity].nil?
      redirect_to '/articles'
    else

      if params[:quantity].to_i==0
        redirect_to '/articles'
      else

        if user_signed_in?
          if current_user.paniers.empty?
            panier = Panier.new(user_id: current_user.id, validated: false)
            panier.save
          else
            if current_user.paniers.last.validated?
              panier = Panier.new(user_id: current_user.id, validated: false)
              panier.save
            
            else
              panier = current_user.paniers.last
            end
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
  end

  def destroy
    unless user_signed_in?
      flash[:error] = "Veuillez vous connecter pour avoir un panier"
      redirect_to '/users/sign_in'
    end
    if params[:article_id].to_i == 0
      flash[:error] = "Vous ne pouvez pas tapez ce que vous voulez dans l'url"
      redirect_to root_path
    end
     unless !params[:article_id].nil?
      flash[:error] = "Vous ne pouvez pas tapez ce que vous voulez dans l'url"
      redirect_to root_path
    end
    unless !current_user.paniers.empty?
      flash[:error] = "Vous n'avez pas de panier"
      redirect_to root_path
    end
    unless !current_user.paniers.last.validated?
      flash[:error] = "Vous n'avez pas de panier"
      redirect_to root_path
    end

    panier = current_user.paniers.last

    list_res = panier.reservations.all
    index = list_res.index {|e| e.article_id == params[:article_id].to_i}

    if index.nil?
      redirect_to '/panier'
    else
      res = list_res.at(index)
      res.destroy.save
      redirect_to '/panier'
    end
  end

  def edit
    unless user_signed_in?
      flash[:error] = "Veuillez vous connecter pour avoir un panier"
      redirect_to '/users/sign_in'
    end
    if params[:article_id].to_i == 0
      flash[:error] = "Vous ne pouvez pas tapez ce que vous voulez dans l'url"
      redirect_to root_path
    end
     unless !params[:article_id].nil?
      flash[:error] = "Vous ne pouvez pas tapez ce que vous voulez dans l'url"
      redirect_to root_path
    end
    if params[:quantity].to_i ==0
      flash[:error] = "Vous ne pouvez pas tapez ce que vous voulez dans l'url"
      redirect_to root_path
    end
    unless !params[:quantity].nil?
      flash[:error] = "Vous ne pouvez pas tapez ce que vous voulez dans l'url"
      redirect_to root_path
    end
    unless !current_user.paniers.empty?
      flash[:error] = "Vous n'avez pas de panier"
      redirect_to root_path
    end
    unless !current_user.paniers.last.validated?
      flash[:error] = "Vous n'avez pas de panier"
      redirect_to root_path
    end

    panier = current_user.paniers.last

    list_res = panier.reservations.all
    index = list_res.index {|e| e.article_id == params[:article_id].to_i}

    if index.nil?
      redirect_to '/panier'
    else
      res = list_res.at(index)
      res.quantity = params[:quantity].to_i
      res.save
      redirect_to '/panier'
    end
  end

  def flush
    unless user_signed_in?
      flash[:error] = "Veuillez vous connecter pour avoir un panier"
      redirect_to '/users/sign_in'
    end
        unless !current_user.paniers.empty?
      flash[:error] = "Vous n'avez pas de panier"
      redirect_to root_path
    end
    unless !current_user.paniers.last.validated?
      flash[:error] = "Vous n'avez pas de panier"
      redirect_to root_path
    end

    panier = current_user.paniers.last
    panier.reservations.each do |r|
      r.destroy.save
    end
    redirect_to '/panier'

  end

end




