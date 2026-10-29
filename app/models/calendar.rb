class Calendar < ApplicationRecord
  belongs_to :tournament
  belongs_to :team_one, class_name: "Team", foreign_key: :team1, optional: true
  belongs_to :team_two, class_name: "Team", foreign_key: :team2, optional: true
  has_many :games
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

  def self.formattedData(calendars = all)
    formatted_data = Hash.new
    month_formatted = Hash.new
    day_formatted = Hash.new {|h,k| h[k] = Array.new }
    calendar_rows = calendars.where.not(start_date_time: nil)
                            .pluck(:start_date_time, :description, :team1, :team2, :id, :status)
    calendar_ids = calendar_rows.map { |row| row[4] }
    summaries_by_calendar = Game.where(enabled: true, calendar_id: calendar_ids)
                                .distinct.pluck(:calendar_id).index_with(true)
    team_names = Team.where(id: calendar_rows.flat_map { |row| [row[2], row[3]] }.compact.uniq)
                     .pluck(:id, :team_name).to_h

    calendar_rows.each do |calendar|
      year, month, day = calendar[0].to_date.to_s.gsub(/-([0-9]*)/){|data| data.to_i.to_s}.split("-")
      summary_registered = summaries_by_calendar.key?(calendar[4])
      status_key = TYPE_STATUS.key(calendar[5])

      day_formatted[day] << {
        "startTime": calendar[0].strftime("%H:%M"),
        "endTime": (calendar[0] + 2.hour).strftime("%H:%M"),
        "text": "#{calendar[1]} (#{team_names[calendar[2]] || I18n.t('ui.team_to_be_decided')} VS #{team_names[calendar[3]] || I18n.t('ui.team_to_be_decided')})",
        "link": "calendars/#{calendar[4]}",
        "summaryRegistered": summary_registered,
        "summaryLabel": I18n.t(summary_registered ? "ui.summary_registered" : "ui.summary_missing"),
        "statusLabel": I18n.t(status_key || "ui.calendar_status"),
        "statusClass": status_key || "unknown",
      }

      month_formatted[month] = day_formatted
      formatted_data[year] = month_formatted
    end
    formatted_data
  end

  def teamDetail1
    Team.find_by(id: team1)
  end

  def teamDetail2
    Team.find_by(id: team2)
  end

end
