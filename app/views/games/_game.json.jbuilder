json.extract! game, :id, :winning_team, :lose_team, :user_id, :description, :created_at, :updated_at
json.url game_url(game, format: :json)
