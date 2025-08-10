class Album < ApplicationRecord
  has_one_attached :main_image
  has_many_attached :images
end
