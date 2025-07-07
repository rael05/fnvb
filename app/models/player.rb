class Player < ApplicationRecord
  belongs_to :team

  has_one_attached :image

  def position_name
    POSITION_HASH[position.to_sym]
  end

  def gender_name
    GENDER_HASH[gender.to_sym]
  end

  POSITION_HASH = {Z: 'Zaguero Central', S: 'Saque', L: 'Libero', R: 'Rematador', A: 'Acomodador'}
  GENDER_HASH = {M: 'Masculino', F: 'Femenino', N: 'No Aplica'}
end
