class AddUserNameToPets < ActiveRecord::Migration[7.1]
  def change
    add_column :pets, :user_name, :string
  end
end
