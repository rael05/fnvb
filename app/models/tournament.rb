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

  def truncate_name
    "#{name&.truncate(45)} (#{year})"
  end

  def completed_name
    "#{name} (#{year})"
  end
end
