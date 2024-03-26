class BibleVerse < ApplicationRecord
  def old_testament?
    book_number < 40
  end

  def new_testament?
    book_number >= 40
  end
end
