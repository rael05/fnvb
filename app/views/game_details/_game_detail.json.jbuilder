json.extract! game_detail, :id, :game_id, :team_id, :player_id, :detail_type, :number_set, :played_minute, :order, :description, :created_at, :updated_at
json.url game_detail_url(game_detail, format: :json)
