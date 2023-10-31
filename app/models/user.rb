class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :adoptions
  has_many :pets, through: :adoptions
  has_one_attached :profile_photo
  has_one :profile
    # Other user-related associations and validations


end
