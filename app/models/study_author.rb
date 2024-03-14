class StudyAuthor < ApplicationRecord
  has_and_belongs_to_many :study_books
  validates :first_name, uniqueness: { scope: :last_name, message: 'First and last name combination already exists' }

  def fullname
    "#{first_name} #{last_name}"
  end
end
