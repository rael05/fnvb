class Article < ApplicationRecord
  belongs_to :user

  translates :name, :description
  validates :name, :description, presence: true

  include ImageUploader::Attachment(:image)
end
