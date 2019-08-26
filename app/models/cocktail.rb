class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  mount_uploader :photo, PhotoUploader
  # belongs_to :user

  validates :name, presence: true, uniqueness: true
end
