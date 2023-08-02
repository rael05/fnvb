class GameDetail < ApplicationRecord
  belongs_to :game

  translates :description
end
