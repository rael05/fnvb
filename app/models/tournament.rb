class Tournament < ApplicationRecord
  has_many :users
  has_many :teams

  has_one_attached :image
  validates_with FileValidator::ImageValidator, image_field_name: :image

  translates :name, :description
end
