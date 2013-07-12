class UsersController < ApplicationController
  def new
  end

  def gestionUser
  	@users = User.all
  end
 
  def show
    @user = User.find(params[:id])
  end

end
