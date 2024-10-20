class BibleVerse < ApplicationRecord
  has_many :verse_comments
  has_and_belongs_to_many :verse_collections

  def full_id
    "#{book} - #{chapter}:#{verse}"
  end

  def old_testament?
    book_number < 40
  end

  def new_testament?
    book_number >= 40
  end

  # Show 5 verses before, 5 verses after
  def context_array(num = 4)
    previous_x(num) + [self] + next_x(num)
  end

  def next_x(num = 1)
    self.class.where('id > ?', id).first(num)
  end

  def previous_x(num = 1)
    self.class.where('id < ?', id).last(num)
  end
end
