class Game < ApplicationRecord
  belongs_to :user
  has_many :game_details

  translates :description
end
