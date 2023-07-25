class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Article.create_translation_table! :title => :string, :description => :text
      end

      dir.down do
        Article.drop_translation_table!
      end
    end
  end
end
