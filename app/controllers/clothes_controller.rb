class ClothesController < ApplicationController

  before_filter :get_article, :only => [:show,:edit]


  def new
    @clothe = Clothe.new
  end


	def create
  	@clothe  = Clothe.new
    @clothe.size= params[:size]
    @clothe.color= params[:color]
    @clothe.article_id= params[:article_id]
    @clothe.stock=params[:stock].to_i
    @clothe.reserve= 0
  	if @clothe.save
    		flash[:success] = "Clothe created!"
    		redirect_to '/admin'
  	else
    		flash[:error] = "Ne marche pas"
    		redirect_to '/admin'
 		end
  end


  def show	
  end


  def edit
    @vet = Clothe.find(params[:id])
 	end

  def update
    @vet = Clothe.find(params[:id])

    respond_to do |quant|
      if @vet.update_attributes(params[:post])
      vet.html { redirect_to(@vet,
                    :notice => 'Post was successfully updated.') }
      vet.xml  { head :ok }
    else
      vet.html { render :action => "edit" }
      vet.xml  { render :xml => @vet.errors,
                    :status => :unprocessable_entity }
    end
  end
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


  protected

  def get_article
    @article = Article.find(params[:id])
  end

end