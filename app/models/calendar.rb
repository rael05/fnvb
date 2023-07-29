class Calendar < ApplicationRecord
  belongs_to :tournament
  translates :description

  TYPE_STAGE = {
    qualification: 'C',
    eighth: 'E',
    quarter: 'Q',
    semi: 'S',
    final: 'F',
  }

  TYPE_STATUS = {
    pending: 'P',
    forfeit: 'F',
    finished: 'T',
  }
end
