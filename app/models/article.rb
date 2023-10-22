class Article < ApplicationRecord
  belongs_to :user

  has_one_attached :pdf_es_file
  validates_with FileValidator::PDFValidator, field_name: :pdf_es_file

  has_one_attached :pdf_en_file
  validates_with FileValidator::PDFValidator, field_name: :pdf_en_file

  has_one_attached :image
  validates_with FileValidator::ImageValidator, image_field_name: :image

  translates :title, :description
end
