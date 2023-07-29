class CreateCalendars < ActiveRecord::Migration[7.0]
  def change
    create_table :calendars do |t|
      t.references :tournament, null: false, foreign_key: true
      t.integer :team1
      t.integer :team2
      t.string :stage, limit: 1, default: 'C'
      t.datetime :start_date_time
      t.string :status, limit: 1, default: 'P'

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Calendar.create_translation_table! :description => :string
      end

      dir.down do
        Calendar.drop_translation_table!
      end
    end
  end
end
