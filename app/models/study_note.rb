class StudyNote < ApplicationRecord
  belongs_to :study_book
  validates :note_text, presence: true
  validates :page_number, presence: true
end
