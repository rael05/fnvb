class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.integer :winning_team
      t.integer :win_score
      t.integer :lose_team
      t.integer :lose_score
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Game.create_translation_table! :description => :string
      end

      dir.down do
        Game.drop_translation_table!
      end
    end
  end
end
