class Game < ApplicationRecord
  belongs_to :user

  translates :description
end
