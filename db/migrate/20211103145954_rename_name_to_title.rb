class RenameNameToTitle < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :name, :title
  end
end
