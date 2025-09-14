class GameDetail < ApplicationRecord
  belongs_to :game

  translates :description

  DETAIL_TYPE_HASH = {
    T: 'Ataque', R: 'Recepción Ataque', D: 'Defensa Ataque', B: 'Bloqueo',
    E: 'Error Saque', A: 'Error Ataque', F: 'Error No Forzado'
  }
end
