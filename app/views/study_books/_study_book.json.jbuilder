json.extract! study_book, :id, :title, :summary, :number_of_pages, :completed, :created_at, :updated_at
json.url study_book_url(study_book, format: :json)
