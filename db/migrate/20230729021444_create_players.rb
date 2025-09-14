class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.integer :number
      t.string :name
      t.string :last_name
      t.string :position, limit: 1
      t.date :birthday
      t.float :weight
      t.float :height
      t.references :team, null: false, foreign_key: true
      t.string :nationality
      t.string :gender, limit: 1
      t.boolean :enabled, default: true

      t.timestamps
    end
  end
end
