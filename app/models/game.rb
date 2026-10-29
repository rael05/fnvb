class Game < ApplicationRecord
  belongs_to :user
  belongs_to :calendar
  has_many :game_details

  validates :win_score, :lose_score, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }, allow_nil: true

  translates :description

  def sync_set_scores_from_details!
    team_ids = [calendar.team1, calendar.team2].compact.uniq
    return unless team_ids.size == 2

    set_wins = game_details.where(detail_type: GameDetail::SET_WON_TYPE, team_id: team_ids).group(:team_id).count
    scores_by_team = team_ids.index_with { |team_id| set_wins.fetch(team_id, 0) }

    if scores_by_team.values.all?(&:zero?)
      update!(winning_team: nil, lose_team: nil, win_score: nil, lose_score: nil)
      return
    end

    last_set_winner = game_details.where(detail_type: GameDetail::SET_WON_TYPE, team_id: team_ids).order(:id).last&.team_id
    leading_team = team_ids.max_by { |team_id| [scores_by_team.fetch(team_id), team_id == last_set_winner ? 1 : 0] }
    trailing_team = (team_ids - [leading_team]).first

    update!(
      winning_team: leading_team,
      lose_team: trailing_team,
      win_score: scores_by_team.fetch(leading_team),
      lose_score: scores_by_team.fetch(trailing_team)
    )
  end
end
