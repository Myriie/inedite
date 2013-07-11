class ArticlesController < ApplicationController


  def new
    @article = Article.new
  end


  def show
  	@article = Article.find(params[:id])
  end


  def index
  	@articles = Article.all
  end


  def cat
  	@type = params[:type]
  end


  def create
    @article  = Article.new(params[:article])
    if @article.save
      flash[:success] = "Article created!"
      redirect_to root_path
    else
      flash[:error] = "Ne marche pas"
      render 'new'
    end
  end


  def edit
    @article = Article.find(params[:id])
  end
  

  def gestionArticle
    @articles = Article.all.sort_by{|a| a.title}
  end


end
