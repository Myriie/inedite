class ArticlesController < ApplicationController
  def new
  end
  def show
  	@article = Article.find(params[:id])
  	@clothes = @article.clothes.find(params[:id])
  end
end
