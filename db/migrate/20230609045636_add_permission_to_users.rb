class AddPermissionToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :permission, :string, default: 'G', limit: 1
  end
end
