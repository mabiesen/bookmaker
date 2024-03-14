class CreateStudyBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :study_books do |t|
      t.string :title
      t.text :summary
      t.integer :number_of_pages
      t.boolean :completed

      t.timestamps
    end
  end
end
