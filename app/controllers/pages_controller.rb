class PagesController < ApplicationController
  before_action :authenticate_user!, only: :home
  
  def home
    @pets = Pet.all
  end
end
