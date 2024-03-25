class CreateBibleVerses < ActiveRecord::Migration[7.1]
  def change
    create_table :bible_verses do |t|
      t.string :book
      t.integer :book_number
      t.integer :chapter
      t.integer :verse
      t.text :verse_text

      t.timestamps
    end
  end
end
