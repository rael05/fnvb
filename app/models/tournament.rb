class Tournament < ApplicationRecord
  has_many :users
  has_many :teams

  translates :name, :description
end
