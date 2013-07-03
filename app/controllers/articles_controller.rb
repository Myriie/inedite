class ArticlesController < ApplicationController
  def new
  end
  def show
  	@article = Article.find(params[:id])
  end
end
