# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# load bible verses
require 'csv'

book_map = {'Genesis': 1,
            'Exodus': 2,
            'Leviticus': 3,
            'Numbers': 4,
            'Deuteronomy': 5,
            'Joshua': 6,
            'Judges': 7,
            'Ruth': 8,
            '1_Samuel': 9,
            '2_Samuel': 10,
            '1_Kings': 11,
            '2_Kings': 12,
            '1_Chronicles': 13,
            '2_Chronicles': 14,
            'Ezra': 15,
            'Nehemiah': 16,
            'Esther': 17,
            'Job': 18,
            'Psalms': 19,
            'Proverbs': 20,
            'Ecclesiastes': 21,
            'Song_of_Solomon': 22,
            'Isaiah': 23,
            'Jeremiah': 24,
            'Lamentations': 25,
            'Ezekiel': 26,
            'Daniel': 27,
            'Hosea': 28,
            'Joel': 29,
            'Amos': 30,
            'Obadiah': 31,
            'Jonah': 32,
            'Micah': 33,
            'Nahum': 34,
            'Habakkuk': 35,
            'Zephaniah': 36,
            'Haggai': 37,
            'Zechariah': 38,
            'Malachi': 39,
            'Matthew': 40,
            'Mark': 41,
            'Luke': 42,
            'John': 43,
            'Acts': 44,
            'Romans': 45,
            '1_Corinthians': 46,
            '2_Corinthians': 47,
            'Galatians': 48,
            'Ephesians': 49,
            'Philippians': 50,
            'Colossians': 51,
            '1_Thessalonians': 52,
            '2_Thessalonians': 53,
            '1_Timothy': 54,
            '2_Timothy': 55,
            'Titus': 56,
            'Philemon': 57,
            'Hebrews': 58,
            'James': 59,
            '1_Peter': 60,
            '2_Peter': 61,
            '1_John': 62,
            '2_John': 63,
            '3_John': 64,
            'Jude': 65,
            'Revelation': 66 }
            

path = Rails.root.to_s + '/db/seed_data/bible.csv'

bible_verses = CSV.readlines(path)

for verse in bible_verses do
  book_number = book_map[verse[1].to_sym] 
  BibleVerse.create!({book: verse[1],
                      book_number: book_number,
                      chapter: verse[2].to_i,
                      verse: verse[3].to_i,
                      verse_text: verse[4]})
end
