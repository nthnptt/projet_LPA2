json.extract! student, :id, :name, :lastname, :birthdate, :created_at, :updated_at
json.url student_url(student, format: :json)
