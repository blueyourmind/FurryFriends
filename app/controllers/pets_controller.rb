# app/controllers/pets_controller.rb
class PetsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_pet, only: [:show, :edit, :update, :destroy, :adopt, :donate]

  def index
    @pets = Pet.all
  end

  def show
    if @pet.user.present?
      @user = @pet.user
      @user_profile = @user.profile
      @profile_photo = @user_profile&.photo
    end
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = current_user.pets.build(pet_params) # Associate the currently logged-in user with the pet

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
      redirect_to @pet, notice: 'Pet was successfully updated.'
    else
      render :edit
    end
  end

 # app/controllers/pets_controller.rb

  def destroy
    # Your code to destroy the pet record
    @pet.destroy
    redirect_to pets_path, notice: 'Pet was successfully destroyed.'
  end


  def adopt
<<<<<<< HEAD

=======
    if @pet.status == 'available'
>>>>>>> 00f5201e9a0a93abe027854710238a44f3e81467
      @pet.update(adopter_id: current_user.id, status: 'adopted')
      redirect_to @pet, notice: 'You have successfully adopted this pet.'
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
    params.require(:pet).permit(:name, :species, :breed, :age, :story, :found_when, :status, :photo)
  end
end
