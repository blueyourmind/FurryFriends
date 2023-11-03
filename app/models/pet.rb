class Pet < ApplicationRecord
  belongs_to :user
  belongs_to :adopter, foreign_key: 'adopter_id', class_name: 'User', optional: true
  has_one_attached :photo
  has_many :pet_adoptions
  has_one :profile
  validates :name, :species, :breed, :age, :story, :found_when, :status, presence: true
  validates :status, inclusion: { in: ['available', 'adopted'] }
end
