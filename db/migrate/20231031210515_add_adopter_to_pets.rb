class AddAdopterToPets < ActiveRecord::Migration[7.1]
  def change
    add_reference :pets, :adopter, foreign_key: { to_table: :users }
  end
end
