class Tournament < ApplicationRecord
  has_many :users
  has_many :teams

  has_one_attached :image

  translates :name, :description

  validate :image_format_validation

  def image_format_validation
    if image.attached?
      unless %w[image/jpg image/png image/jpeg].include?(image.content_type)
        errors.add :base, I18n.t(:error_format_file) + ' jpg, png, jpeg'
      end
    end
  end
end
