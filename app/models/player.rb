class Player < ApplicationRecord
  belongs_to :team

  def position_name
    POSITION_HASH[position.to_sym]
  end

  POSITION_HASH = {Z: 'Zaguero Central', S: 'Saque', L: 'Libero', R: 'Rematador', A: 'Acomodador'}
end
