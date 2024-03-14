class StudyBook < ApplicationRecord
  has_and_belongs_to_many :study_authors
  validates :title, presence: true
  validates :number_of_pages, presence: true
  validates :study_author_ids, length: { minimum: 1, message: ' - At least one author must be associated' }
end