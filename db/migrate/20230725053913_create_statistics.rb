class CreateStatistics < ActiveRecord::Migration[7.0]
  def change
    create_table :statistics do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :enabled, default: true

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Statistic.create_translation_table! :title => :string, :description => :text
      end

      dir.down do
        Statistic.drop_translation_table!
      end
    end
  end
end
