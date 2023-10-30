# app/models/pet.rb
class Pet < ApplicationRecord
  belongs_to :user, optional: true  # A pet can be associated with a user, but it's not required
  has_one_attached :photo
  has_one :profile


  validates :name, :species, :breed, :age, :story, :found_when, :status, presence: true
  validates :status, inclusion: { in: ['available', 'adopted'] }
end
