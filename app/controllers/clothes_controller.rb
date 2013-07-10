class ClothesController < ApplicationController


	def create
    	@clothe  = Clothe.new
      @clothe.size= params[:size]
      @clothe.color= params[:color]
      @clothe.article_id= params[:article_id]
    	if @clothe.save
      		flash[:success] = "Clothe created!"
      		redirect_to '/admin'
    	else
      		flash[:error] = "Ne marche pas"
      		redirect_to '/admin'
   		 end
  	end

  	def show
  		@article = Article.find(params[:id])
  	end

    def edit
    	@article = Article.find(params[:id])
 	end


  def delete
      @clothe  = Clothe.find(params[:id].to_i)
      @clothe.destroy
      if @clothe.save
          flash[:success] = "Deletion complete"
          redirect_to '/admin'
      else
          flash[:error] = "Ne marche pas"
          redirect_to '/admin'
       end


  end
end