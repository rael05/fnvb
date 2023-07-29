json.extract! player, :id, :number, :name, :last_name, :position, :birthday, :weight, :height, :team_id, :nationality, :created_at, :updated_at
json.url player_url(player, format: :json)
