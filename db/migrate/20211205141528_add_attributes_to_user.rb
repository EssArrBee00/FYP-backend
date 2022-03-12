class AddAttributesToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :phone, :string
    add_column :users, :gender, :string
    add_column :users, :dob, :date
  end
end
