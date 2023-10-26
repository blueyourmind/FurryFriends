
    class RemoveLocationAndImageUrlFromPets < ActiveRecord::Migration[6.1]
      def change
        remove_column :pets, :location, :string
        remove_column :pets, :image_url, :string
      end
    end
