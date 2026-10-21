class Tournament < ApplicationRecord
  has_many :tournament_teams
  has_many :teams, through: :tournament_teams
  has_many :users
  has_many :calendars
  has_many :albums

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

  def status_key
    calendarios = calendars.where(enabled: true)
    pending = Calendar::TYPE_STATUS[:pending]
    return :scheduled if calendarios.empty? || calendarios.where.not(status: pending).empty?
    return :concluded if calendarios.where(status: pending).empty?
    :in_progress
  end
end
