class AddCalendarToGames < ActiveRecord::Migration[7.0]
  def change
    add_reference :games, :calendar, null: false, foreign_key: true
  end
end
