class BibleVerse < ApplicationRecord
  has_many :verse_comments

  def full_id
    "#{book} - #{chapter}:#{verse}"
  end

  def old_testament?
    book_number < 40
  end

  def new_testament?
    book_number >= 40
  end
end
