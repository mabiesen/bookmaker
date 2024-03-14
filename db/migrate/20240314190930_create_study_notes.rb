class CreateStudyNotes < ActiveRecord::Migration[7.1]
  def change
    create_table :study_notes do |t|
      t.references :study_book, null:false, foreign_key: true
      t.integer :page_number
      t.text :note_text

      t.timestamps
    end
  end
end
