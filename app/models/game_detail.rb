class GameDetail < ApplicationRecord
  belongs_to :game

  translates :description

  before_validation :default_number_set, on: :create
  before_validation :clear_player_for_set_won
  after_commit :sync_set_scores_after_create, on: :create
  after_commit :sync_set_scores_after_update, on: :update
  after_commit :sync_set_scores_after_destroy, on: :destroy

  validates :played_minute, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
  validate :limit_set_won_details, if: -> { detail_type == SET_WON_TYPE }

  SET_WON_TYPE = 'S'

  DETAIL_TYPE_HASH = {
    T: 'Ataque', R: 'Recepción Ataque', D: 'Defensa Ataque', B: 'Bloqueo',
    E: 'Error Saque', A: 'Error Ataque', F: 'Error No Forzado',
    S: 'Set Ganado'
  }

  private

  def default_number_set
    return if number_set.present? || game_id.blank?

    self.number_set = GameDetail.where(game_id: game_id, detail_type: SET_WON_TYPE).count + 1
  end

  def clear_player_for_set_won
    self.player_id = nil if detail_type == SET_WON_TYPE
  end

  def sync_set_scores_after_create
    game&.sync_set_scores_from_details! if detail_type == SET_WON_TYPE
  end

  def sync_set_scores_after_update
    previous_type = saved_change_to_detail_type&.first
    return unless detail_type == SET_WON_TYPE || previous_type == SET_WON_TYPE

    game&.sync_set_scores_from_details!
  end

  def sync_set_scores_after_destroy
    game&.sync_set_scores_from_details! if detail_type == SET_WON_TYPE
  end

  def limit_set_won_details
    return if game_id.blank?

    existing_set_wins = GameDetail.where(game_id: game_id, detail_type: SET_WON_TYPE)
    existing_set_wins = existing_set_wins.where.not(id: id) if persisted?
    errors.add(:detail_type, I18n.t("ui.max_set_won_details")) if existing_set_wins.count >= 5
  end
end
