class AddImageDataToTournaments < ActiveRecord::Migration[7.0]
  def change
    add_column :tournaments, :image_data, :text
  end
end
