class Pet < ApplicationRecord



  has_many :adoptions
  has_many :users, through: :adoptions


  validates :status, inclusion: { in: ['available', 'adopted'] }
end
