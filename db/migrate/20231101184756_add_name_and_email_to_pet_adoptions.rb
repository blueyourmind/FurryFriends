class AddNameAndEmailToPetAdoptions < ActiveRecord::Migration[7.1]
  def change
    add_column :pet_adoptions, :your_name, :string
    add_column :pet_adoptions, :email, :text
  end
end
