class Tournament < ApplicationRecord
  has_many :users
  has_many :teams

  translates :name, :description
  validates :name, :description, presence: true

  include ImageUploader::Attachment(:image)
end
