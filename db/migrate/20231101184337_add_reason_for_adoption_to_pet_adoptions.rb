class AddReasonForAdoptionToPetAdoptions < ActiveRecord::Migration[7.1]
  def change
    add_column :pet_adoptions, :reason_for_adoption, :text
  end
end
