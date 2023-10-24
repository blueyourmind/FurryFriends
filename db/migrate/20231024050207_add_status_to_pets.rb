class AddStatusToPets < ActiveRecord::Migration[7.1]
  def change
    add_column :pets, :status, :string
  end
end
