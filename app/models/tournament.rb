class Tournament < ApplicationRecord
  has_many :tournament_teams
  has_many :teams, through: :tournament_teams
  has_many :users
  has_many :calendars

  has_one_attached :image
  validates_with FileValidator::ImageValidator, image_field_name: :image

  translates :name, :description

  validates :name, presence: true
  validates :description, presence: true
end
