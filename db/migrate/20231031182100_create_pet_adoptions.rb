class CreatePetAdoptions < ActiveRecord::Migration[7.1]
  def change
    create_table :pet_adoptions do |t|
      t.string :your_name
      t.string :email
      t.text :reason_for_adoption

      t.timestamps
    end
  end
end
