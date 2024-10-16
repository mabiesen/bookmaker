class CreateVerseComments < ActiveRecord::Migration[7.1]
  def change
    create_table :verse_comments do |t|
      t.references :bible_verse, null:false, foreign_key: true
      t.text :comment

      t.timestamps
    end
  end
end
