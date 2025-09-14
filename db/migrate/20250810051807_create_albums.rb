class CreateAlbums < ActiveRecord::Migration[7.0]
  def change
    create_table :albums do |t|
      t.string :name
      t.boolean :enable, default: true
      t.references :tournament, null: false, foreign_key: true
      t.boolean :enabled, default: true

      t.timestamps
    end
  end
end
