class Tournament < ApplicationRecord
  has_many :users

  translates :name, :description
end
