class RenameRoleToCategory < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :role, :category
  end
end
