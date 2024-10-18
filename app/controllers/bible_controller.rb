class BibleController < ApplicationController
  def home
  end

  def verses
    @bible_verses = BibleVerse.order(book_number: :asc, chapter: :asc, verse: :asc)
    render json: @bible_verses
  end
end
