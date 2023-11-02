class PetAdoptionsController < ApplicationController


  def new
    @pet = Pet.find_by(id: params[:pet_id])
    if @pet.nil?
       flash[:alert] = "The selected pet could not be found. Please select a valid pet."
       redirect_to pets_path
    else
       @adoption = PetAdoption.new
    end
   end

   def create
    @adoption = PetAdoption.new(adoption_params)
    @pet = Pet.find_by(id: params[:pet_adoption][:pet_id])
    if @pet.nil?
       flash[:alert] = "The selected pet could not be found. Please select a valid pet."
       render 'new'
    else
       @adoption.pet = @pet
       if @adoption.save
         redirect_to thank_you_path
       else
         flash[:alert] = @adoption.errors.full_messages.to_sentence
         render 'new'
       end
    end
   end

   def destroy
    @adoption = PetAdoption.find(params[:id])

    if @adoption.destroy
      flash[:notice] = 'Adoption request was successfully deleted.'
    else
      flash[:alert] = 'Failed to delete the adoption request.'
    end

    redirect_to user_adoptions_path(user_id: current_user.id)
  end

  def show
    @pet_adoption = PetAdoption.find(params[:id])
    redirect_to root_path # Redirect to the root page or another appropriate page
  end

   def adoption_params
    params.require(:pet_adoption).permit(:user_id, :your_name, :email, :reason_for_adoption, :pet_id)
   end
end
