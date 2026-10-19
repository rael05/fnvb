class Game < ApplicationRecord
  belongs_to :user
  belongs_to :calendar
  has_many :game_details

  translates :description
end
