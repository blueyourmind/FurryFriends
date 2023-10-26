class AddPhotoToPets < ActiveRecord::Migration[7.1]
  def change
    add_column :pets, :photo, :string
  end
end
