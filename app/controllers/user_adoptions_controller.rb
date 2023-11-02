class UserAdoptionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @adoptions = @user.pet_adoptions
  end

  def destroy
    @adoption = PetAdoption.find(params[:id])
    @adoption.destroy
  end
end
