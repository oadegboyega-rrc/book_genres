class CreateReviews < ActiveRecord::Migration[8.0]
  def change
    create_table :reviews do |t|
      t.text :content
      t.integer :rating
      t.string :reviewer_name
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
