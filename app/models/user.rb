class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :pet_adoptions
  has_many :pets
  has_one_attached :profile_photo
  has_one :profile
end
