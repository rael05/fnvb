class AddPlayedMinuteToGameDetails < ActiveRecord::Migration[7.0]
  def change
    add_column :game_details, :played_minute, :integer
  end
end
