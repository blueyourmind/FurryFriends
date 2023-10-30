class AddEmailToPets < ActiveRecord::Migration[7.1]
  def change
    add_column :pets, :email, :string
  end
end
