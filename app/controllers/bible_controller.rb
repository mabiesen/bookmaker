class BibleController < ApplicationController
  def home
    @bible_verses = BibleVerse.order(book_number: :asc, chapter: :asc, verse: :asc)
  end
end
