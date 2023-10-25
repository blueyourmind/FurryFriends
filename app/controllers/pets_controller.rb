class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy, :adopt, :donate]

  def index
    @pets = Pet.all
  end


  def show
    @pet = Pet.find(params[:id])
  end


  def new
    @pet = Pet.new
  end



  def create
    @pet = Pet.new(pet_params)

    # Process the uploaded photos
    if pet_params[:photos].present?
      pet_params[:photos].each do |image|
        @pet.photos.build(image: image)
      end
    end

    if @pet.save
      redirect_to @pet, notice: 'Pet was successfully created.'
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
    @pet = Pet.find(params[:id])
    @pet.destroy
    redirect_to pets_path, notice: 'Pet was successfully deleted.'
  end


  def adopt
    @pet = Pet.find(params[:id])
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

  def pet_params
    params.require(:pet).permit(:name, :species, :breed, :age, :story, :found_when, :status)
  end
end

  def set_pet
    @pet = Pet.find(params[:id])
  end
