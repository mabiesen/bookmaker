class BibleController < ApplicationController
  def home; end

  # GET request for json, returns raw bible_verses
  def verses
    @bible_verses = BibleVerse.order(book_number: :asc, chapter: :asc, verse: :asc)
    render json: @bible_verses
  end

  # GET request, returns summary of verse notes, collections, etc.
  def verse_summary
    @bible_verse = BibleVerse.find(params[:id])
  end

end
