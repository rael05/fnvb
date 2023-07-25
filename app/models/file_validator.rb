class FileValidator < ActiveModel::Validator
  class ImageValidator < FileValidator
    def validate(record)
      image = record.send(options[:image_field_name])
      unless image.attached?
        return true
      end
      unless %w[image/jpg image/png image/jpeg].include?(image.content_type)
        record.errors.add :base, I18n.t(:error_format_file) + ' jpg, png, jpeg'
      end
    end
  end

  class PDFValidator < FileValidator
    def validate(record)
      pdf_file = record.send(options[:field_name])
      unless pdf_file.attached?
        return true
      end
      unless %w[application/pdf].include?(pdf_file.content_type)
        record.errors.add :base, I18n.t(:error_format_file) + ' pdf'
      end
    end
  end
end
