class ArticlesController < ApplicationController
  before_filter :get_all_articles , :only =>[:index,:gestionArticle,:cat]
  before_filter :get_article_by_id, :only => [:show,:edit,:destroy,:update]

  def new
  end


  def gestionArticle
  end


  def show
  end


  def index
  end


  def cat
  	@type = params[:type]
  end


  def create
    @article  = Article.new
    @article.title = params[:title]
    @article.description = params[:description]
    @article.price = params[:price].to_f
    @article.type_art = params[:article][:type_art]

   

    if @article.save
        oth = Other.new 
        oth.article_id = @article.id
        oth.stock = params[:stock]
        oth.reserve = 0
      if oth.save
        flash[:success] = "Article created!"
        redirect_to article_path(@article.id)
        else
        flash[:error] = "Other Ne marche pas"
        render 'new'
      end    
     else
      flash[:error] = "Article Ne marche pas"
      render 'new'
    end
  end


  def edit
  end


  def destroy
    if @article.destroy.save
      flash[:success] = "Article destroyed!"
      redirect_to '/gestionArticle'
    else
      flash[:error] = "Ne marche pas"
      render article_path(@article.id)
    end
  end

  def update
    @article.price = params[:price].to_f
    @article.description = params[:description]
    @article.type_art = params[:article][:type_art]
    
    if @article.save
      flash[:success] = "Article modifie"
      redirect_to article_path(@article.id)

    else
      flash[:error] = "Modification impossible"
      redirect_to edit_article_path(@article.id)
    end


  end


  protected

  def get_all_articles
    @articles = Article.all.sort_by{|a| a.title}
  end


  def get_article_by_id
    @article = Article.find(params[:id])
  end


end
