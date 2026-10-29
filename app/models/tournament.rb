class Tournament < ApplicationRecord
  STATUS_KEYS = %w[scheduled in_progress concluded].freeze

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
  validates :status, inclusion: { in: STATUS_KEYS }, allow_nil: true

  def truncate_name
    "#{name&.truncate(45)} (#{year})"
  end

  def completed_name
    "#{name} (#{year})"
  end

  def status_key
    return status.to_sym if STATUS_KEYS.include?(status)

    calendarios = calendars.where(enabled: true)
    pending = Calendar::TYPE_STATUS[:pending]
    return :scheduled if calendarios.empty? || calendarios.where.not(status: pending).empty?
    terminal_statuses = [Calendar::TYPE_STATUS[:forfeit], Calendar::TYPE_STATUS[:finished]]
    return :concluded if calendarios.where.not(status: terminal_statuses).empty?

    :in_progress
  end
end
