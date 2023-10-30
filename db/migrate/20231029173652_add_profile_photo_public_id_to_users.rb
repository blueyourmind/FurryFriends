class AddProfilePhotoPublicIdToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :profile_photo_public_id, :string
  end
end
