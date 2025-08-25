class CreateGameDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :game_details do |t|
      t.references :game, null: false, foreign_key: true
      t.references :player, null: true, foreign_key: true
      t.references :team, null: false, foreign_key: true
      t.string :detail_type, limit: 1
      t.integer :number_set
      t.integer :order

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
