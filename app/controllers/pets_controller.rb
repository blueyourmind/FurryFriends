class PetsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_pet, only: [:show, :edit, :update, :destroy, :adopt]

  def index
    @pets = Pet.all
  end

 

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    if @pet.save

      redirect_to @pet, notice: 'Pet for adoption was successfully created.'
    else

      render :new
    end
  end


  def edit
  end

  def update
    if @pet.update(pet_params)
      redirect_to @pet, notice: 'Pet was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @pet.destroy
    redirect_to pets_path, notice: 'Pet was successfully destroyed.'
  end

  def adopt

    @pet_adoption = PetAdoption.new(pet_adoption_params)

    @pet_adoption.pet = Pet.find(params[:id])

    if @pet_adoption.save

      redirect_to root_path, notice: 'Thank you for your adoption request.'
    else
      # @pet = Pet.find(params[:pet_id])
      redirect_to root_path
    end
  end


  def donate
    if @pet.status == 'adopted'
      @pet.update(donor_id: current_user.id, status: 'available')
      redirect_to @pet, notice: 'You have successfully donated this pet.'
    else
      redirect_to @pet, alert: 'This pet cannot be donated at the moment.'
    end
  end

  def adopted_pets
    @adopted_pets = Pet.where(status: 'adopted')
  end

  private


  def set_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :species, :breed, :age, :story, :found_when, :status, :photo)
  end

  def pet_adoption_params
    params.require(:pet).permit(:your_name, :email, :reason_for_adoption)
   end
end
