class CreateStudyAuthorsStudyBooksJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_join_table :study_authors, :study_books
  end
end
