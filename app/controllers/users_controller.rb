class UsersController < ApplicationController
  def new
  end

  def gestionUser
  	@users = User.all
  end

  def show 
  end

end
