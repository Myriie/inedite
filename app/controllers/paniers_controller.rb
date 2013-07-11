class PaniersController < ApplicationController

   before_filter :login, :only => [:show,:destroy,:add,:edit,:flush]
   before_filter :set_panier, :only => [:destroy,:show, :add,:edit,:flush]
   before_filter :set_article_id, :only => [:add,:destroy,:edit]
   before_filter :set_quantity, :only => [:add, :edit]
   before_filter :panier_vide, :only => [:destroy,:edit,:flush]


  def show
  end


  def add
    list_res = @panier.reservations.all
    index = list_res.index {|e| e.article_id == @article.id}

    if index.nil?
      res = Reservation.new(article_id: @article.id,panier_id: @panier.id, quantity: @quantity)
    else
      res = list_res.at(index)
      res.quantity+=@quantity
    end
    res.save
    redirect_to '/panier'
  end


  def destroy
    list_res = @panier.reservations.all
    index = list_res.index {|e| e.article_id == @article.id}

    if index.nil?
      redirect_to '/panier'
    else
      res = list_res.at(index)
      res.destroy.save
      redirect_to '/panier'
    end
  end


  def edit
    list_res = @panier.reservations.all
    index = list_res.index {|e| e.article_id == params[:article_id].to_i}

    if index.nil?
      redirect_to '/panier'
    else
      res = list_res.at(index)
      res.quantity = @quantity
      res.save
      redirect_to '/panier'
    end
  end


  def flush
    @panier.reservations.each do |r|
      r.destroy.save
    end
    redirect_to '/panier'
  end



protected

    def login
      unless user_signed_in?
        flash[:error] = "Veuillez vous connecter pour avoir un panier"
        redirect_to '/users/sign_in'
      end
    end


    def set_panier
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
    end


    def set_article_id
      if params[:article_id].to_i == 0
        flash[:error] = "Vous ne pouvez pas tapez ce que vous voulez dans l'url"
        redirect_to root_path
      end
      unless !params[:article_id].nil?
        flash[:error] = "Vous ne pouvez pas tapez ce que vous voulez dans l'url"
        redirect_to root_path
      end
      @article = Article.find(params[:article_id].to_i)
    end


    def set_quantity
      if params[:quantity].to_i ==0
        flash[:error] = "Vous ne pouvez pas tapez ce que vous voulez dans l'url"
        redirect_to root_path
      end
      unless !params[:quantity].nil?
        flash[:error] = "Vous ne pouvez pas tapez ce que vous voulez dans l'url"
        redirect_to root_path
      end
      @quantity = params[:quantity].to_i
    end


    def panier_vide
        unless !current_user.paniers.empty?
        flash[:error] = "Vous n'avez pas de panier"
        redirect_to root_path
      end
      unless !current_user.paniers.last.validated?
        flash[:error] = "Vous n'avez pas de panier"
        redirect_to root_path
      end
    end


end