json.extract! article, :id, :user_id, :name, :description, :image_data, :created_at, :updated_at
json.url article_url(article, format: :json)
