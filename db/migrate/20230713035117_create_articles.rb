class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.references :user, null: false, foreign_key: true
      t.text :image_data

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Article.create_translation_table! :name => :string, :description => :text
      end

      dir.down do
        Article.drop_translation_table!
      end
    end
  end
end
