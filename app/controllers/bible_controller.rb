class BibleController < ApplicationController
  def home
    @bible_verses = BibleVerse.all
  end
end
