class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy, :adopt, :donate]


  def index
    @pets = Pet.all
  end

  def show

  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)

    if @pet.save
      redirect_to pet_path(@pet), notice: 'Pet was successfully created.'
    else
      render :new
    end
  end


  def edit

  end

  def update
    if @pet.update(pet_params)
      redirect_to pet_path(@pet), notice: 'Pet was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @pet.destroy
    redirect_to pets_path, notice: 'Pet was successfully destroyed.'
  end

  def adopt

    if @pet.status == 'available'
      @pet.update(adopter_id: current_user.id, status: 'adopted')
      redirect_to @pet, notice: 'You have successfully adopted this pet.'
    else
      redirect_to @pet, alert: 'This pet is not available for adoption.'
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



  private

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :species, :breed, :age, :story, :found_when, :status)
  end


end
