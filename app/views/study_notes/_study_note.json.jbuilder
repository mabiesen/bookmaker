json.extract! study_note, :id, :page_number, :note_text, :created_at, :updated_at
json.url study_note_url(study_note, format: :json)
