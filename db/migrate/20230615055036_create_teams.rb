class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.references :tournament, null: false, foreign_key: true
      t.string :team_name, null: false
      t.string :color_shirt1, null: false
      t.string :color_short1, null: false
      t.string :color_shirt2
      t.string :color_short2
      t.string :color_shirt3
      t.string :color_short3
      t.string :delegate_name
      t.string :delegate_last_name
      t.string :head_coach_name, null: false
      t.string :head_coach_last_name, null: false
      t.string :assistant_coach1_name, null: false
      t.string :assistant_coach1_last_name, null: false
      t.string :assistant_coach2_name
      t.string :assistant_coach2_last_name
      t.string :doctor_name
      t.string :doctor_last_name
      t.string :physiotherapist_name
      t.string :physiotherapist_last_name
      t.string :statistical_name
      t.string :statistical_last_name
      t.string :international_referee_name
      t.string :international_referee_last_name

      t.timestamps
    end
  end
end
