class GameDetail < ApplicationRecord
  belongs_to :game

  translates :description

  validates :played_minute, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true

  DETAIL_TYPE_HASH = {
    T: 'Ataque', R: 'Recepción Ataque', D: 'Defensa Ataque', B: 'Bloqueo',
    E: 'Error Saque', A: 'Error Ataque', F: 'Error No Forzado'
  }
end
