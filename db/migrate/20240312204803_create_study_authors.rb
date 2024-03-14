class CreateStudyAuthors < ActiveRecord::Migration[7.1]
  def change
    create_table :study_authors do |t|
      t.string :first_name
      t.string :last_name
      
      t.timestamps
      t.index [:first_name, :last_name], unique: true
    end
  end
end
