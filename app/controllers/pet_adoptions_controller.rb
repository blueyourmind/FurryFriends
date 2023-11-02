
class PetAdoptionsController < ApplicationController
  def new
    @pet_adoption = PetAdoption.new
    @pet = Pet.find(params[:pet_id])
  end

  def create
    @pet_adoption = PetAdoption.new(pet_adoption_params)

    if @pet_adoption.save

      redirect_to thank_you_path, notice: 'Thank you for your adoption request.'
    else
      @pet = Pet.find(params[:pet_id])
      render 'new'
    end
  end

  def thank_you

  end

  private

  def pet_adoption_params
    params.require(:pet_adoption).permit(:your_name, :email, :reason_for_adoption)

  end
end
