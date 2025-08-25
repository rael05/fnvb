class GameDetail < ApplicationRecord
  belongs_to :game

  translates :description

  DETAIL_TYPE_HASH = {
    T: 'Ataque', R: 'Rec-Ataque', D: 'Def-Ataque', B: 'Bloqueo',
    E: 'Error Saque', A: 'Error Ataque', F: 'Error NF'
  }
end
