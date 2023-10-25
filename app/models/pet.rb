class Pet < ApplicationRecord

  has_many :adoptions
  has_many :users, through: :adoptions
  # validates :image_url, presence: true
  validates :status, inclusion: { in: ['available', 'adopted'] }
  validates :name, :species, :breed, :age, :story, :found_when, :status, presence: true
end
