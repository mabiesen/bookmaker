class VerseCollection < ApplicationRecord
  has_and_belongs_to_many :bible_verses
end
