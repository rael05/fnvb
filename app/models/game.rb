class Game < ApplicationRecord
  belongs_to :user
  belongs_to :calendar
  has_many :game_details

  validates :win_score, :lose_score, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }, allow_nil: true

  translates :description
end
