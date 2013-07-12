class ArticlesController < ApplicationController
  before_filter :get_all_articles , :only =>[:index,:gestionArticle,:cat]
  before_filter :get_article_by_id, :only => [:show,:edit,:destroy]

  def new
    @article = Article.new
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


  protected

  def get_all_articles
    @articles = Article.all.sort_by{|a| a.title}
  end


  def get_article_by_id
    @article = Article.find(params[:id])
  end


end
