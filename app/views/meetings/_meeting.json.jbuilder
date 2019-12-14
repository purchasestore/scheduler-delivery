json.extract! meeting, :id, :name, :localization, :phone, :start_time, :created_at, :updated_at
json.url meeting_url(meeting, format: :json)
