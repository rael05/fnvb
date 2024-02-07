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

  def self.formattedData
    formatted_data = Hash.new
    month_formatted = Hash.new
    day_formatted = Hash.new {|h,k| h[k] = Array.new }
    pluck(:start_date_time, :description, :team1, :team2, :id).each do |calendar|
      year, month, day = calendar[0].to_date.to_s.gsub(/-([0-9]*)/){|data| data.to_i.to_s}.split("-")

      day_formatted[day] << {
        "startTime": calendar[0].strftime("%H:%M"),
        "endTime": (calendar[0] + 2.hour).strftime("%H:%M"),
        "text": "#{calendar[1]} (#{calendar[2]} VS #{calendar[3]})",
        "link": "calendars/#{calendar[4]}",
      }

      month_formatted[month] = day_formatted
      formatted_data[year] = month_formatted
    end
    formatted_data
  end
end
