class Team < ApplicationRecord
  belongs_to :tournament
  has_many :users

  has_one_attached :image
  validates_with FileValidator::ImageValidator, image_field_name: :image
end
