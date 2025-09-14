class CreateTournaments < ActiveRecord::Migration[7.0]
  def change
    create_table :tournaments do |t|
      t.boolean :international
      t.integer :year, default: Date.current.year
      t.boolean :enabled, default: true

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Tournament.create_translation_table! :name => :string, :description => :text
      end

      dir.down do
        Tournament.drop_translation_table!
      end
    end
  end
end
