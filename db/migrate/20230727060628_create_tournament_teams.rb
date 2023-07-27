class CreateTournamentTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :tournament_teams do |t|
      t.belongs_to :tournament
      t.belongs_to :team

      t.timestamps
    end
  end
end
