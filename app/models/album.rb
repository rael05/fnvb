class Album < ApplicationRecord
  belongs_to :tournament

  has_one_attached :main_image
  has_many_attached :images
end
