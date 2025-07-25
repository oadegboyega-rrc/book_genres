class CreateBooks < ActiveRecord::Migration[8.0]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :publication_year
      t.string :isbn
      t.string :cover_image
      t.text :description
      t.references :author, null: false, foreign_key: true

      t.timestamps
    end
  end
end
