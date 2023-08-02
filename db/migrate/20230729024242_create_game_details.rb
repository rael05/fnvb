class CreateGameDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :game_details do |t|
      t.references :game, null: false, foreign_key: true
      t.string :game_time

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        GameDetail.create_translation_table! :description => :text
      end

      dir.down do
        GameDetail.drop_translation_table!
      end
    end
  end
end
