class Team < ApplicationRecord
  has_many :tournament_teams
  has_many :tournaments, through: :tournament_teams
  has_many :users
  has_many :players

  has_one_attached :image
  validates_with FileValidator::ImageValidator, image_field_name: :image
end
