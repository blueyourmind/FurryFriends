class AddPetIdToPetAdoptions < ActiveRecord::Migration[7.1]
  def change
    add_column :pet_adoptions, :pet_id, :integer
  end
end
