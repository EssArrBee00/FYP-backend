class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :body
      t.integer :rating_stars
      t.references :products,null: false,foreign_key: true
      t.references :users, null: false,foreign_key: true


      t.timestamps
    end
  end
end
