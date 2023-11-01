class AddUserNameToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :user_name, :string, unique: true, limit: 25, null: false
  end
end
