class UserAdoptionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @adoptions = @user.pet_adoptions
  end
  
end
