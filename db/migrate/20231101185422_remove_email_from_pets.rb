class RemoveEmailFromPets < ActiveRecord::Migration[7.1]
  def change
    remove_column :pets, :email, :string
  end
end
