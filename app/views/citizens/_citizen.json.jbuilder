json.extract! citizen, :id, :full_name, :document_number, :cns, :email, :status, :birth_date, :created_at, :updated_at
json.url citizen_url(citizen, format: :json)
