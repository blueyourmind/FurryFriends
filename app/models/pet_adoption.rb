class PetAdoption < ApplicationRecord
  belongs_to :user
  belongs_to :pet
  validates :your_name, presence: true
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :reason_for_adoption, presence: true
end
